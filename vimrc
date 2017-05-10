"==============================================================================
" Plugins
"==============================================================================

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible', { 'tag': 'v1.1' }
Plug 'tpope/vim-unimpaired'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/csapprox'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/darkspectrum'
Plug 'w0ng/vim-hybrid'

" Status
Plug 'bling/vim-airline'

" Files and directories
Plug 'djoshea/vim-autoread'
Plug 'fweep/vim-tabber'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

" Formatting
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
Plug 'godlygeek/tabular'
Plug 'jceb/vim-orgmode'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

" Movement
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

" Programming
Plug 'OmniSharp/omnisharp-vim', { 'for': 'csharp' }
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go'
Plug 'joonty/vdebug'
Plug 'kburdett/vim-nuuid'
Plug 'majutsushi/tagbar'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-dispatch'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'

call plug#end()

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

let g:tabber_divider_style = 'unicode'
set tabline=%!tabber#TabLine()

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

if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
endif

if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

set scrolloff=3                 " Pad the cursor with 3 lines
set scrolljump=5                " Scroll by 5 lines
set number                      " Show line numbers
set relativenumber              " Relative to the current line

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

set list                        " Enable hidden characters
set listchars=tab:▷·            " Show tab characters
set listchars+=trail:·          " Show trailing spaces

set wildmode=longest,list       " Make completion mode acts like Bash

set showcmd                     " Show incomplete normal mode commands
set noshowmode                  " Hide current mode

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set visualbell t_vb=            " Be quiet

set pastetoggle=<F3>

set mouse=a                     " Allow movement using the mouse in all modes

set autoread                    " Reload files that changed outside of vim

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

" Pretty-print json
nnoremap <silent> <Leader>JS :%!python -m json.tool<CR>
vnoremap <silent> <Leader>JS :'<,'>!python -m json.tool<CR>

" Toggle mouse mode
map <F2> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>

" FZF {{{
nmap <C-p> :call SmartFzfSearching()<CR>
nmap g<C-p> :Files<CR>
nmap gs<C-p> :GFiles?<CR>

nmap <leader>T :BTags<CR>
nmap g<leader>T :Tags<CR>

nmap <leader>l :BLines<CR>
nmap g<leader>l :Lines<CR>

nmap <leader>b :Buffers<CR>

nmap <leader>c :BCommits<CR>
nmap g<leader>c :Commits<CR>
" }}}

"==============================================================================
" Plugin Settings
"==============================================================================

let g:elm_setup_keybindings=0

" FZF {{{
let g:fzf_buffers_jump=1
"  }}}

let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore=['\.swp$', '\~$', '\.swo$', '\.git', '\.hg', '\.svn']
let NERDTreeMapOpenInTab='\r'

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
nmap <silent> <Leader>bb :TagbarToggle<CR>

let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_statusline=1
let g:webdevicons_enable_ctrlp=1

let g:airline_powerline_fonts=1

let g:syntastic_mode_map = {
    \ 'mode': 'active',
  \ }

let g:syntastic_php_checkers = ["php7", "phpcs", "phpmd"]
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages={ 'type': 'style' }
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
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

" Edit crontabs in-place
autocmd FileType crontab setlocal nobackup nowritebackup

" Wrap text-like files
autocmd FileType markdown setlocal wrap linebreak nolist
autocmd FileType gitcommit setlocal wrap linebreak nolist
autocmd FileType conf setlocal wrap linebreak nolist

augroup END

"==============================================================================
" Functions
"==============================================================================

" Smarter FZF Searching {{{
" Stolen from FZF's repo since it isn't an exported function
function! s:get_git_root()
  if exists('*fugitive#repo')
    try
      return fugitive#repo().tree()
    catch
    endtry
  endif
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! SmartFzfSearching()
    let root = s:get_git_root()
    if empty(root)
        Files
    else
        GFiles
    endif
endfunction
" }}}

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
