imap jj <ESC>
imap jk <ESC>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

execute pathogen#infect()
syntax on
filetype plugin indent on

" force diffs to be vertical - for fugitive
set diffopt+=vertical

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number

execute pathogen#infect()

" autostart nerdtree
autocmd vimenter * NERDTree

" fix subdirectory navigation NERDTree
set encoding=utf-8
let g:NERDTreeDirArrows=0
let NERDTreeShowHidden=1
map <F2> :NERDTreeToggle<CR>
map nt :NERDTreeToggle<CR>

" linting config for syntastic
set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

colorscheme apprentice
