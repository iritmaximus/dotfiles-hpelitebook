" Vimrc setup


nnoremap <SPACE> <Nop>        " make sure space is not mapped to something else
let mapleader = "\<SPACE>"    " leader key mapped to space

set nocompatible              " needs to be on for reasons
syntax on                     " syntax highlighting
filetype plugin on            " idunno plugins work

set timeoutlen=1000 ttimeoutlen=10  " disables esc wait time
set updatetime=300                  " sets how often vim updates ex. plugins
set fileformat=unix           " linebreaks to unix?
set encoding=UTF-8            " propably dont have to do this but ok

if has("nvim")
  set clipboard+=unnamedplus  " uses system clipboard
else
  set clipboard=unnamedplus   " not sure if this has to be different, dont bother to test
endif

autocmd BufEnter * lcd %:p:h  " set vim dir to where vim was opened

" different tab lengths for different filetypes
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

au BufNewFile,BufRead *.ts
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

set tabstop=2             " tablength?
set softtabstop=2         " not completely sure xd
set shiftwidth=2          " also not sure
set autoindent            " automatically indents, duh...
set smartindent           " knows how to live with if and such (?)
set smarttab              " lol
set expandtab             " no idea

set nowrap                " no linewrapping if lines go over the border
set textwidth=0           " disables line hard wrapping
set wrapmargin=0          " trying harder to disable the wrapping
set list                  " absolutely no clue

" hidden characters
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<

" set cursorline          " horisontal line where the cursor is
" set cursorcolumn        " vertical cursorline

set number                " set line numbers
set relativenumber        " set relative line numbers
set scrolloff=10          " screen rolls x amount of lines before
set signcolumn=yes       " shows the column on the left if there is something
" to show

set showcmd               " lol not this one either
" set noshowmode            " shows which mode you are in
set conceallevel=0        " does not 'conceal' for ex. quotations in json
set noerrorbells visualbell t_vb= " disables noises

set ignorecase            " search is not case sensitive if all lower
set smartcase             " if you include upper, then it is case sensitive
set incsearch             " suggest autocomplete's smartly???
set hlsearch              " highlights everything searched


" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

set mouse=a                 " mouse support
set t_Co=256                " 256 color support



" SOURCING

" so ~/.vim/autoclose.vim         " bracket pairing
" so ~/.vim/plugin/setcolors.vim  " for switching the colorthemes



" KEYBINDS
nnoremap <CR> :noh<CR><CR>:<backspace>
nnoremap <Leader>s :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>e :edit .<CR>
nnoremap <Leader>n :tabnew<CR>


" PLUGINS


" polyglot
" let g:polyglot_disabled = ['vim']

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'           " implements git commands in vim
Plug 'airblade/vim-gitgutter'       " git diffs in signcolumn

Plug 'dylanaraps/wal.vim'           " nice changing colors
Plug 'NLKNguyen/papercolor-theme'   " some nice colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

Plug 'dense-analysis/ale'           " linting and syntax checking

Plug 'tpope/vim-commentary'         " comments lines
Plug 'somini/vim-autoclose'         " closes brackets smartly
Plug 'Yggdroot/indentLine'          " shows | on different indenting levels

" Plug 'sheerun/vim-polyglot'       " didin't work properly with typescript
Plug 'leafgarland/typescript-vim'   " typescript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'     " jsx aka react syntax highlighting

Plug 'takac/vim-hardtime'
Plug 'vimwiki/vimwiki'

" nvim spesific
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " not sure how to use in init.vim
" Plug 'tree-sitter/tree-sitter-typescript'

call plug#end()


" PLUGIN THINGS


" papercolor-theme
set background=dark                       " dark or light theme
colorscheme dracula                       " for the nice colors


" indentLine
let g:indentLine_setColors = 0                    " not sure what this does
let g:indentLine_color_term = 239                 " set the iL color to gray
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " what chars are used to show indention xd


" ale

" so alehover works
augroup ale_hover_cursor
  autocmd!
  autocmd CursorHold * ALEHover
augroup END

let g:ale_hover_to_floating_preview = 1     " not sure if this helps
let g:ale_hover_cursor = 1      " enables ale to show things on hover
let g:ale_set_balloons = 1      " enables ale to use hover 'balloons' aka preview window

let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

let g:ale_fix_on_save = 1                       " ale triggers fixer on file save
let g:ale_sign_column_always = 1                " shows char in the signcolumn
let g:ale_echo_msg_error_str = 'E'              " error char
let g:ale_echo_msg_warning_str = 'W'            " error char
let g:ale_echo_msg_info_str = 'I'               " info char
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'    " message format
let g:ale_linters_explicit = 1                  " run only linters i specify

let g:ale_fixers = {
\  "*": [ "remove_trailing_lines", "trim_whitespace" ]
\}

" vim hard mode

let g:hardtime_default_on = 0

nnoremap <Leader>hh :HardTimeToggle<CR>
nnoremap <Leader>H :HardTimeOff<CR>


" COOL PLUGINLESS STUFF
set path+=**                  " tab completion for file related things

set wildmenu                  " cool tab menu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


command! MakeTags !ctags -R .  " command to create the 'tags'

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list



" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=0  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:
" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)
