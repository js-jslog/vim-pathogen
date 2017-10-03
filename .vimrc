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
set cursorline
set visualbell
set ignorecase
set splitright

" Auto resize vim splits to make active split more readible
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999 " this looks like a duplication to me

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Toggle relative numbering and set to absolute on loss of focus and insert
" mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn() " This looks like it should be the other function
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn() " This looks like it should be the other function
autocmd InsertLeave * call ToggleRelativeOn()

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

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

set noshowmode

let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left':[ [ 'mode', 'paste' ],
            \            [ 'gitbranch', 'readonly', 'filename', 'modified' ]
            \   ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'filename': 'LightLineFilename',
            \ },
            \ }
function! LightLineFilename()
    return expand('%')
endfunction
