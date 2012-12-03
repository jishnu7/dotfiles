call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set encoding=utf8 "utf8 as standard

set nu "always show line numbers

" Tabs
set smarttab
set expandtab "space instead of tab
set shiftwidth=4 "tab = spaces
set tabstop=4
set softtabstop=4 

set ai "auto indent
set si "smart indent
set wrap "wrap lines

set showmatch "show matching brackets

syntax enable "syntax highlighting
set background=dark
"colorscheme ir_black

"set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

"autoload CloseTag for xml/html files
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
