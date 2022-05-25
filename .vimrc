" add sleuth.vim ?


let mapleader = "," " map leader to comma

set timeoutlen=1000 ttimeoutlen=10 " disables esc wait time

syntax on             " needed for at least vimwiki
set nocompatible      " for vimwiki 
filetype plugin on

set fileformat=unix
set encoding=UTF-8

set clipboard=unnamedplus

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" tried to remove linewrapping
"au BufNewFile,BufRead *.txt
    "\ 

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab

set nowrap              " no window wrapping
set list
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<

"set cursorline          " horisontal cursor highlight
"set cursorcolumn      " vertical
set number              " line numbers
set scrolloff=10        " screen rolls when x amount of lines left
set signcolumn=yes

set showcmd
set noshowmode
set conceallevel=1      " makes things compact 

set noerrorbells visualbell t_vb=

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>:<backspace>

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" vim autoclose plugin does most thigns but this {<Enter>} thing
so ~/.vim/autoclose.vim         " bracket pairing
so ~/.vim/plugin/setcolors.vim  " for switching the colorthemes


"set textwidth=80               " hard sets the wrapping
set mouse=a                     " enables mouse things


let g:ale_disable_lsp = 1       " so coc and ale don't clash  
let g:ale_set_balloons = 0      " makes screen scroll up when mouse moved




" Plugin part
call plug#begin('~/.vim/plugged')


Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dylanaraps/wal.vim'
"Plug 'jelera/vim-javascript-syntax'
Plug 'ap/vim-css-color'


Plug 'scrooloose/nerdtree'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc-json, coc-tsserver, coc-clangd, coc-html, coc-css
Plug 'dense-analysis/ale'
"Plug 'sheerun/vim-polyglot'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'


Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'easymotion/vim-easymotion'
Plug 'somini/vim-autoclose'
Plug 'Yggdroot/indentLine'
"Plug 'SirVer/ultisnips'
Plug 'neoclide/coc-snippets'
Plug 'honza/vim-snippets'


Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()



" WAL things

colorscheme wal


" Dracula things
" colorscheme dracula


" commented out to make room for wal 

" Gruvbox things
"set termguicolors
"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='soft'
"colorscheme gruvbox
"set background=dark

"hi Normal guibg=NONE ctermbg=NONE
"let g:terminal_ansi_colors = [
    "\ '#282828', '#cc241d', '#98971a', '#d79921',
    "\ '#458588', '#b16286', '#689d6a', '#a89984',
    "\ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
    "\ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
"\]



" Nerdtree things

nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
"set wildignore+=*.DS_Store,*.min.*
"autocmd BufWinEnter * silent NERDTreeMirror.


" https://dev.to/mr_destructive/vim-nerdtree-28ep


" Open nerdtree window on opening Vim [and move cursor to the other window] | wincmd p
"autocmd VimEnter * NERDTree | wincmd p

" refreshes nerdtree when files change and also when mouse hover
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" if directory changes, refresh
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

" closes nerdtree if vim closes 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" leader r will set nerdtree dir to current file path
"map <leader>r :NERDTreeFind<cr>
autocmd BufEnter * lcd %:p:h



" Airline things
let g:airline#extensions#ale#enabled = 1  " ale things
let g:airline_powerline_fonts = 1         " something something powerline fonts

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"

"let g:airline_section_a = ''
let g:airline#extensions#default#section_truncate_width = {}
"let g:airline#extensions#default#section_truncate_width = {
    "\ 'a': 1,
    "\ 'b': 79,
    "\ 'x': 60,
    "\ 'y': 88,
    "\ 'z': 45,
    "\ 'warning': 80,
    "\ 'error': 80,
    "\ }


" indent things 
" 
"let g:indentLine_color_term = 245
let g:indentLine_setColors = 0



" coc vim"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
 inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

 function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
 endfunction

" TAB DOESNT WORK AFTER THIS
" find the site and add the other script also

" jumps to next placeholder
let g:coc_snippet_next = '<tab>'

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'



" GoTo code navigation.
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
 "inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" makes enter confirm the selected competion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

 " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif



" Ale things"

"let g:ale_fix_on_save = 1
let g:ale_hover_to_preview = 0
let g:ale_sign_column_always = 1
let g:ale_cursor_detail = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters_explicit = 1



" easymotion things"

" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)

map   f <Plug>(easymotion-bd-f)
nmap  f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" Inden line thing
"
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " what chars are used to show indention xd
"let g:indentLine_setColors = 0 " set your own color
"let g:indentLine_bgcolor_term = 202
let g:indentLine_color_term = 239




" emmet things

" so coc's ctrl y doesnt clash with this
let g:user_emmet_leader_key=','
