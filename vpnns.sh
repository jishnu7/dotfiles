#!/usr/bin/env zsh
# original: https://schnouki.net/posts/2014/12/12/openvpn-for-a-single-application-on-linux/

if [[ $UID != 0 ]]; then
    echo "This must be run as root."
    exit 1
fi

function iface_up() {
    ip netns add frootvpn

    ip netns exec frootvpn ip addr add 127.0.0.1/8 dev lo
    ip netns exec frootvpn ip link set lo up

    ip link add vpn0 type veth peer name vpn1
    ip link set vpn0 up
    ip link set vpn1 netns frootvpn up

    ip addr add 10.200.200.1/24 dev vpn0
    ip netns exec frootvpn ip addr add 10.200.200.2/24 dev vpn1
    ip netns exec frootvpn ip route add default via 10.200.200.1 dev vpn1

    iptables -A INPUT \! -i vpn0 -s 10.200.200.0/24 -j DROP
    iptables -t nat -A POSTROUTING -s 10.200.200.0/24 -o wl+ -j MASQUERADE

    sysctl -q net.ipv4.ip_forward=1

    mkdir -p /etc/netns/frootvpn
    echo 'nameserver 8.8.8.8' > /etc/netns/frootvpn/resolv.conf

    ip netns exec frootvpn ping -c 2 www.google.com
}

function iface_down() {
    sysctl -q net.ipv4.ip_forward=0

    iptables -D INPUT \! -i vpn0 -s 10.200.200.0/24 -j DROP
    iptables -t nat -D POSTROUTING -s 10.200.200.0/24 -o wl+ -j MASQUERADE

    ip netns delete frootvpn
    ip link delete vpn0
    rm -rf /etc/netns/frootvpn
}

function run() {
    shift
    ip netns exec frootvpn sudo -u jishnu "$@"
}

function deluge() {
    shift
    ip netns exec frootvpn su jishnu -c "eval \$(dbus-launch --sh-syntax) && export DBUS_SESSION_BUS_ADDRESS && export DBUS_SESSION_BUS_PID && deluge"
}

function vpnip() {
    echo "Public IP: "
    curl ipecho.net/plain; echo
    echo "VPN IP:"
    ip netns exec frootvpn curl ipecho.net/plain;
    echo ""

    echo "Public IP: "
    curl http://ipinfo.io/; echo
    echo "VPN IP:"
    ip netns exec frootvpn curl http://ipinfo.io/
    echo ""
}

function ping() {
    ip netns exec frootvpn ping www.google.com
}

function start_vpn() {
    sudo ip netns exec frootvpn openvpn --config /etc/openvpn/us.ovpn
    sudo ip netns exec frootvpn ip a show dev vpn1 up;
}

case "$1" in
    up)
        iface_up ;;
    down)
        iface_down ;;
    run)
        run "$@" ;;
    ping)
        ping ;;
    ip)
        vpnip ;;
    start)
        start_vpn ;;
    *)
        echo "Syntax: $0 up|down|run|start|ping"
        exit 1
        ;;
esac
