"==============================================================================
" Plugins
"==============================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" General
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'

" Colors
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/csapprox'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-scripts/darkspectrum'
Plugin 'ryanoasis/vim-devicons'

" Status
Plugin 'bling/vim-airline'

" Files and directories
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle 'DavidEGx/ctrlp-smarttabs'
Plugin 'mileszs/ack.vim'
Bundle 'djoshea/vim-autoread'

" Formatting
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'

" Movement
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'

" Programming
Plugin 'scrooloose/syntastic'
Plugin 'rayburgemeestre/phpfolding.vim'
Plugin 'joonty/vdebug'
Plugin 'go.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

call vundle#end()

"==============================================================================
" Environment Settings
"==============================================================================

set t_Co=256
set t_ut=  " Force vim to use the background color for the whole line
set background=dark

" Set up theme
colorscheme gruvbox
let g:airline_theme='papercolor'
autocmd BufReadPost * highlight Comment cterm=none

if has ('x') && has ('gui')     " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')              " On mac and windows, use * register for copy-paste
    set clipboard=unnamed
endif

set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set nospell
set nowrap

set expandtab                   " Tab key inserts spaces
set softtabstop=4               " Use 4 spaces for indentation
set shiftwidth=4                " Use 4 spaces for indentation

set ignorecase                  " Default to case insensitive searches
set smartcase                   " Unless uppercase letters are present
set hlsearch                    " Highlight searches
set incsearch                   " Search while typing

set scrolloff=3                 " Pad the cursor with 3 lines
set scrolljump=5                " Scroll by 5 lines
set number                      " Show line numbers
set relativenumber              " Relative to the current line

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
silent! set colorcolumn=120     " Draw right margin at 120 characters

set list                        " Enable hidden characters
set listchars=tab:▷·            " Show tab characters
set listchars+=trail:·          " Show trailing spaces

set wildmode=longest,list       " Make completion mode acts like Bash

set showcmd                     " Show incomplete normal mode commands
set noshowmode                  " Hide current mode

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set visualbell t_vb=            " Be quiet

set pastetoggle=<F12>

set autoread

"==============================================================================
" Mappings
"==============================================================================

let mapleader="\\"

" Remap esc to prevent carpal tunnel
imap jj <Esc>

" Prevent p from replacing the buffer (copy what was originally selected)
vnoremap p pgvy

" Preserve selection on indent
vnoremap < <gv
vnoremap > >gv

" Make Y yank to end of line
nnoremap Y y$

" Align delimiting characters
noremap <silent> <Leader>a= :Tabularize /=<CR>
noremap <silent> <Leader>a> :Tabularize /=><CR>
noremap <silent> <Leader>a: :Tabularize /:<CR>

" Jump back and forth between Git hunks
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap [h :GitGutterPrevHunk<CR>

" Toggle NERD Tree
nnoremap <silent> <Leader>nt :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>

" Fast saving
nnoremap <Leader>w :w!<CR>

" Create a new tab
nnoremap <Tab><Enter> :tabedit<Space>

" Move to previous and next tabs
nnoremap <silent> [<Tab> :tabprev<CR>
nnoremap <silent> ]<Tab> :tabnext<CR>

" Move tabs left or right
nnoremap <silent> g{ :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> g} :execute 'silent! tabmove ' . tabpagenr()<CR>

" Kill all line numbers to enable copy over SSH
nnoremap <silent> <Leader>con :set nonumber<CR>:set norelativenumber<CR>:sign unplace *<CR>

" Git grep
nnoremap <silent> <Leader>g :tab split<CR>:Ggrep<Space>

" Yank to shared clipboard
noremap <silent> gy :w! ~/.clipboard<CR>:echo 'Selection written to ~/.clipboard'<CR>

" Navigate merge conflicts
nnoremap <silent> <Leader>mc /^(<<<<<<<\\|=======\\|>>>>>>>)<CR>

"==============================================================================
" Plugin Settings
"==============================================================================

let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore=['\.swp$', '\~$', '\.swo$', '\.git', '\.hg', '\.svn']
let NERDTreeMapOpenInTab='\r'

nmap <leader>T :CtrlPBufTag<CR>
nmap <leader><leader>T :CtrlPBufTagAll<CR>
nmap <leader>b :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' 
  \ }

let g:ctrlp_user_command = {
  \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
nmap <silent> <Leader>bb :TagbarToggle<CR>

let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_statusline=1
let g:webdevicons_enable_ctrlp=1

let g:airline_powerline_fonts=1
let g:airline_left_sep='▓▒'
let g:airline_right_sep='▒▓'

let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': [],
  \ }
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages={ 'type': 'style' }
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='!'
let g:syntastic_check_on_wq=0
let g:airline#extensions#syntastic#enabled = 1

let g:gist_post_private=1

let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:ycm_server_python_interpreter = '/usr/bin/python'
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"==============================================================================
" Auto Commands
"==============================================================================

augroup vimrc

" Clear existing commands in this group
autocmd!

" Show absolute line numbers in insert mode
autocmd InsertEnter * set number norelativenumber
autocmd InsertLeave * set number relativenumber

" Highlight lines with more than 120 characters
autocmd BufWinEnter * let w:m3=matchadd('ErrorMsg', '\%>120v.\+', -1)

" Disable whitespace at the end of comments
autocmd FileType * setlocal formatoptions-=w

" Strip whitespace when saving certain types of files
autocmd FileType php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Jump to the last cursor position when opening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always start at the top of a commit message
autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Open the quickfix window with grep results
autocmd QuickFixCmdPost *grep* cwindow

augroup END

"==============================================================================
" Vim-go
"==============================================================================

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)

"==============================================================================
" Local Configurations
"==============================================================================

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
