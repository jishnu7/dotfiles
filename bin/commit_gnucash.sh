cd ~/git/gnucash
git add -u
now=`date '+%d %b'`
git commit -m "${now}"
git push origin master
