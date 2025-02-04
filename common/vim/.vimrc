set noeb vb t_vb=
set shortmess+=I

set t_u7=

set nocompatible

set rtp+=/bin/fzf

" --- Vundle ---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Core
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpenguinltg/vim-closing-brackets'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-rooter'
Plugin 'qpkorr/vim-bufkill'
Plugin 'vim-scripts/genutils'
Plugin 'derekwyatt/vim-fswitch'

" Tools
Plugin 'junegunn/fzf'
Plugin 'Glamhoth/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-fugitive'

" Colors
Plugin 'andreasvc/vim-256noir'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'octol/vim-cpp-enhanced-highlight'

" Languages
Plugin 'tikhomirov/vim-glsl'
Plugin 'rust-lang/rust.vim'

call vundle#end()
" --- Vundle ---

filetype plugin indent on

" --- Scheme ---
syntax on
colorscheme 256_noir

autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=#1c1c1c
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212

set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
highlight LineNr ctermfg=5 guifg=#888888

let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
" --- Scheme ---

" --- Settings ---
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set copyindent
set cursorline
set enc=utf-8
set expandtab
set fenc=utf-8
" set foldmarker=/**,*/
set nofoldenable
set foldmethod=syntax
set gdefault
set hidden
set history=1000
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:\ \
set nobackup
set noshowmode
set noswapfile
set nowrap
set number
set relativenumber
set ruler
set scrolloff=999
set shiftround
set shiftwidth=4
set showcmd
set softtabstop=4
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=4
set tags+=/usr/include/**/tags
set tags+=../tags
set timeout timeoutlen=1000 ttimeoutlen=100
set undodir=~/.vim/vimfiles/undo
set undofile
set undolevels=1000
set wildmenu
set wildmode=list:longest,list:full

" --- Keyboard ---
let mapleader="\<Space>"

nnoremap ; :

imap <silent> jj <Esc>

nmap <F1> <nop>
imap <F1> <nop>
vmap <F1> <nop>
nmap <silent> <F2> :w!<CR>
imap <silent> <F2> <Esc>:w!<CR>
vmap <silent> <F2> <Esc>:w!<CR>
nmap <leader><leader> :Buffers<CR>
nmap <silent> <Leader>f :Ack "<C-R><C-W>"<CR>
map <silent> <F7> :set hlsearch!<CR>
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nmap <silent> <F9> :AsyncRun ninja<CR><C-W><C-J>
nmap <silent> <F10> :AsyncRun ./run.sh<CR>

nnoremap ' `
nnoremap ` '

nmap B ^
vmap B ^
nmap E $
nmap E $

nnoremap Y y$

nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <C-\> :set paste!<CR>
vmap <C-\> :set paste!<CR>

nmap <C-j> 10j
nmap <C-k> 10k
vmap <C-j> 10j
vmap <C-k> 10k

nnoremap <Leader>h <C-W><C-h>
nnoremap <Leader>l <C-W><C-l>
nmap H <C-W><C-K>
nmap L <C-W><C-J>

nmap <silent> <Leader>t :enew<CR>
nmap <silent> <Leader>k :bnext<CR>
nmap <silent> <Leader>j :bprevious<CR>
nmap <silent> <Leader>q :BD!<CR>
nmap <silent> <Leader>w :ccl<CR>

nnoremap j gj
nnoremap k gk

nmap <C-o> o<Esc>ko
imap <C-o> <Esc>o<Esc>ko

nmap <Tab> %

nmap <Leader>= <C-W>=

autocmd FileType rust   nmap <silent> <C-f> :RustFmt<CR><F2>
autocmd FileType cpp    nmap <silent> <C-f> :ClangFormat<CR><F2>

autocmd FileType xml    setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType robot  setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml   setlocal tabstop=2 shiftwidth=2 softtabstop=2
" --- Keyboard ---

" --- Airline ---
let g:airline_theme='distinguished'

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline_section_c='%t'

let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#rith_sep=''
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'

let g:airline_section_y=''
" --- Airline ---

" --- AsyncRun ---
let g:asyncrun_open = 30
" --- AsyncRun ---

" --- fzf ---
nmap <F1> :Files<CR>
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors = { 'prompt': ['fg', 'Normal'],
                   \ 'pointer': ['fg', 'Normal'],
                   \ 'spinner': ['fg', 'Normal'],
                   \ 'info': ['fg', 'Normal'] }
let g:fzf_preview_window = ''
" --- fzf ---

" --- ack.vim ---
if executable('ag')
    let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'
endif
" --- ack.vim ---

" --- Tagbar ---
map <F4> :TagbarToggle<CR>
let g:tagbar_compact = 1
" --- Tagbar ---

" --- fswitch ---
au! BufEnter *.cpp let b:fswitchdst = 'hpp'
au! BufEnter *.hpp let b:fswitchdst = 'cpp'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'
au! BufEnter *.cc let b:fswitchdst = 'hh' | let b:fswitchlocs = '../include/*'
au! BufEnter *.hh let b:fswitchdst = 'cc'
au! BufEnter *.asn let b:fswitchdst = 'acn' | let b:fswitchlocs = '.'
au! BufEnter *.acn let b:fswitchdst = 'asn' | let b:fswitchlocs = '.'
nnoremap <silent> <Leader>] :FSHere<cr>
" --- fswitch ---

" --- rooter ---
let g:rooter_patterns = ['tags']
let g:rooter_silent_chdir = 1
" --- rooter ---

" --- rust ---
let g:rust_set_foldmethod = 1
" --- rust ---

highlight ColorColumn ctermbg=3
match ColorColumn /\%121v\s*\S/
