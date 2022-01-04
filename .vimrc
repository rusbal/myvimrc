" ========== Vim Basic Settings ============="

" Pathogen settings.
"#filetype off
"#call pathogen#runtime_append_all_bundles()
"#call pathogen#infect()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim.git'
Plugin 'rking/ag.vim'
Plugin 'MarcWeber/vim-addon-mw-utils' "vim-snipmate dependency
Plugin 'tomtom/tlib_vim'              "vim-snipmate dependency
Plugin 'garbas/vim-snipmate'
Plugin 'elixir-editors/vim-elixir' " Elixir
Plugin 'paredit.vim'
Plugin 'elmcast/elm-vim' " Elm

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

Plugin 'kchmck/vim-coffee-script'

" PHP
Plugin 'arnaud-lb/vim-php-namespace'

" Vue JS
Plugin 'posva/vim-vue'

" HTML
Plugin 'mattn/emmet-vim'

call vundle#end()

filetype plugin indent on

" Make vim incompatbile to vi.
set nocompatible
set modelines=0

"TAB settings.
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set nobackup
syntax enable
syntax on

"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

"set relativenumber
set number
set norelativenumber

"set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3

"Changing Leader Key
let mapleader = ","
""""
" Set title to window
set title 
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Enable Mouse
set mouse=a
"set smartindent

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %


" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1
" set colorcolumn=80

" Fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

" Rope settings."
inoremap <leader>j <ESC>:RopeGotoDefinition<cr>

" Get Rid of stupid help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

inoremap <leader>w <ESC>:w<cr>
nnoremap <leader>w :w<cr>

" Copy to clipboard
nnoremap <leader>m :w !pbcopy<cr>
xnoremap <leader>m :w !pbcopy<cr>

" Map : to ; also in command mode.
"nnoremap ; :

" Set vim to save the file on focus out.
au FocusLost * :wa

" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
""nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
nnoremap <leader>q gqip

" ,v Select just pasted text.
nnoremap <leader>v V`]

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" jj For Qicker Escaping between normal and editing mode.
"inoremap jj <ESC>

" Set NERDTree width to 25
nnoremap <leader>N :vertical res 29<cr>

" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =

"set backupdir=$TMPDIR//
"set directory=$TMPDIR//


" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=node_modules
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*/vendor

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

nnoremap g; g;zz

" =========== END Basic Vim Settings ===========


" >>> Special binding rules <<<

" > Folding the leftcolumn toggle. < "
nnoremap <leader>f :call FoldColumnToggle()<cr>

" direct mapping may disable other mappings done on this keybinding.
"imap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

" > Quick Fix Toggle to see the quickfix window < "
nnoremap <leader>q :call QuickFixToggle()<cr>

" Global variable keeping track of the state of the quick fix window.
let g:quickfix_is_open = 0

function! QuickFixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" > Spell checker Toggler <
nnoremap <leader>c :call SpellChecker()<cr>

let g:spell_checker_is_active = 0
function! SpellChecker()
    if g:spell_checker_is_active
        setlocal spell spelllang=
        let g:spell_checker_is_active = 0
    else
        setlocal spell spelllang=en_us
        let g:spell_checker_is_active = 1
    endif
endfunction

" >>> END Special binding rules <<<

" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style

    set guifont=Cousine\ 10
else
    set t_Co=256
endif

set background=dark
"let g:solarized_termcolors=256
"colorscheme badwolf



" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="

" Mapping to NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

" Mini Buffer some settigns."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Tab color settings to make it more visible.
hi MBEChanged ctermfg=white
hi MBENormal ctermfg=white

" Rope Plugin settings
" imap <leader>j <ESC>:RopeGotoDefinition<cr>
nmap <leader>j <ESC>:RopeGotoDefinition<cr>

" Tagbar key bindings."
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i

" Snipmate remap settings. It's binding overwritten standard
" bindings.
" Snipmate using bellow VIM's default keys, just unmap it.
" autocmd VimEnter * unmap! <C-i>

nmap <leader>e :tabe ~/.vimrc<CR>

nmap <leader>p :set paste<CR>
nmap <leader>P :set nopaste<CR>

" Raymond
let NERDTreeIgnore=['node_modules', 'storage']
set ff=unix
"command Bd :NERDTreeClose :NERDTreeToggle

autocmd Filetype help nmap <buffer> q :q<CR>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Color line number
highlight LineNr ctermfg=2
highlight Search cterm=NONE ctermfg=0 ctermbg=7

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "Dispatch rspec {spec}"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" remove trailing whitespace
nnoremap W :%s/\s\+$//e<CR>

" Switch back to previous buffer
nnoremap 3 :b#<CR>
" Close [Quickfix list]
nnoremap 4 :ccl<CR>

" Set comment color to gray
:hi Comment ctermfg=8

" If you don't like the fact that when you press Up and Down on a wrapped line, you get to the next physical line instead of the next line on the screen, you can do something like this:
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" PHP
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
set tags+=tags,tags.vendors

" =========== END Plugin Settings =========="
"
