set encoding=utf-8
set nocompatible

set smartindent
set autoindent

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set t_Co=256
set background=dark
colorscheme molokai

set ttyfast

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Show cursor line.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set backupdir=~$HOME/.vim/_backup " where to put backup files.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set laststatus=2                  " Show the status line all the time
set list                          " Show invisible characters
set listchars=tab:▸\ ,eol:¬

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.scssc,*.sassc

set autoread                      " Update open files when changed externally


" vim-plug automatic installation

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-endwise'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'kchmck/vim-coffee-script'
Plug 'ervandew/supertab'
Plug 'danro/rename.vim'
Plug 'toyamarinyon/vim-swift'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on
  filetype indent on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " Remove trailing whitespaces
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd BufNewFile,BufRead *.eco set ft=html
endif

let mapleader=","

map <leader>gg :e Gemfile<cr>
map <leader>gr :e config/routes.rb<cr>
map <leader>db :e config/database.yml<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :e %%
map <leader>sp :sp %%
map <leader>vsp :vsp %%

" Fzf shortcuts
map <leader>f :Files<cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Store backup files on tmp
set backupdir=~/tmp

" Use poweline fonts in airline
let g:airline_powerline_fonts=1
let g:airline_theme="tomorrow"

" Nerdtree
map <leader>n :NERDTree<cr>

" alias command
command W w
command Wq wq
command Q q
command Bd bd

" Enable syntax highlighting on Vagrantfiles and Berksfiles
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Berksfile set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" Indent all the file
map <leader>i mmgg=G`m<CR>

" Environment notes
map <Leader>pn :sp ~/notes/project_notes.txt<cr>
" Open a file in a current directory
cabbr <expr> %% expand('%:p:h')

" ag helpers
let g:ackprg = 'ag --vimgrep'
map <Leader>a :Ag<space>

