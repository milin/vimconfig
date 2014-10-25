" My vimrc file
"
" Maintainer: Milind Shakya
" Last change:	2014 April 23
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.


set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set encoding=utf-8

runtime! debian.vim
" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" allow backspacing over everything in insert mode
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>v :Gblame<CR>
filetype off
execute pathogen#infect()

call pathogen#helptags()

filetype plugin indent on
syntax on

colorscheme delek

set backspace=indent,eol,start

"Python Mode Settings
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
let g:pymode = 1
let g:pymode_doc = 0
let g:pymode_lint_cwindow = 0
let g:miniBufExplForceSyntaxEnable = 1
set hidden


" isort
let g:vim_isort_map = '<C-i>'


" Enable this for just NerdTree
" NerdTreeTabsToggle kind takes care of this
map <leader>n :NERDTreeToggle<CR>
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
let g:pymode_run = 0
map <leader>g :GundoToggle<CR>
nmap <leader>a <Esc>:Ack!
" Tagbar

nnoremap <silent> <TAB> :TagbarToggle<CR>
nnoremap <silent> <> :TagbarToggle<CR>

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" Pytest
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>
" Enable this you want nerdtree for every tab
" Might replace it with NerdTreeTabs soon
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror

" if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
" else
"  set backup		" keep a backup file
" endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype on
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis


" if you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" Formatting code
set ts=4  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=4  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
set ruler
set nohlsearch " Disable auto highlighting after search

" Turn on line numbers
set number

" Don't leave backup file
set nobackup

" Tab Completion
imap <Tab> <C-P>

" Code Folding
set foldmethod=indent
set foldlevel=99

" Add F2 hot key for running Ruby programs
map <f2> :w\|!clear;ruby %<cr>

" Add F3 hot key for running rake
map <f3> :w\|!clear;rake

" Add F4 hot key for compiling C programs
map <f4> :w\|!clear;gcc %<cr>

" ADD F6 hot key to save file opened using VIM that required root permissions
map <f6> :w !sudo tee %
map <f7> :%s/\s\+$//

" Navigate through vim buffers
map bg :bn <CR>
map vf :bp <CR>
map bb :Gblame <CR>
" Delete current buffer without 
" interferring with panes
map bk :bp\|bd # <CR> 
" For easier vim split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable syntax highlighting when buffers were loaded through :bufdo, which
" disables the Syntax autocmd event to speed up processing.
augroup EnableSyntaxHighlighting
    " Filetype processing does happen, so we can detect a buffer initially
    " loaded during :bufdo through a set filetype, but missing b:current_syntax.
    " Also don't do this when the user explicitly turned off syntax highlighting
    " via :syntax off.
    " Note: Must allow nesting of autocmds so that the :syntax enable triggers
    " the ColorScheme event. Otherwise, some highlighting groups may not be
    " restored properly.
    autocmd! BufWinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) | syntax enable | endif

    " The above does not handle reloading via :bufdo edit!, because the
    " b:current_syntax variable is not cleared by that. During the :bufdo,
    " 'eventignore' contains "Syntax", so this can be used to detect this
    " situation when the file is re-read into the buffer. Due to the
    " 'eventignore', an immediate :syntax enable is ignored, but by clearing
    " b:current_syntax, the above handler will do this when the reloaded buffer
    " is displayed in a window again.
    autocmd! BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif
augroup END

