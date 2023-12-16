set nocompatible            " vi defaults off, vim defaults on

" Unmap arrow keys in both normal and insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set encoding=utf-8          " Default encoding of files are utf-8
set fileencoding=utf-8      " Set the encoding for the file in this buffer
set fileencodings=utf-8     " Set the list of encodings to use while opening a buffer
"set bomb                    " Set Byte Order Marker (BOM) on
scriptencoding utf-8        " Set script's encoding to utf-8

set fileformats=dos,unix,mac    " Try the said fileformats during EOL automatic detection

set background=dark         " Set background to dark to make terminal Vim happy

filetype plugin indent on   " Load plugins and indentation info according to filetype
syntax enable               " Enable syntax highlighting

set autoindent              " Indent according to previous line
set smartindent             " Be smart about the indentation

set expandtab               " Use spaces instead of tabs
set tabstop=4               " Tab key is display with 4 spaces in normal mode
set softtabstop=4           " Tab key indents by 4 spaces in insert mode
set shiftwidth=4            " >> indents by 4 spaces
set shiftround              " >> indents to next multiple of 'shiftwidth'

set backspace=indent,eol,start  " Make backspace work as expected

set hidden                      " Switch between buffers without having to save first

set laststatus=2                                             " Always display the statusline
set statusline=[%n]                                          " Buffer no
set statusline+=\ %<%F                                       " Show full filename truncated at the start
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}]            " File encoding
set statusline+=\ %w%h%m%r                                   " [Preview],[help],modified,[RO] flags
set statusline+=\ [%{&ff}]                                   " File Format
set statusline+=\ %y                                         " Type of file
set statusline+=\ [ASCII:%b,Hex:%B]                          " Hex values of char under cursor
set statusline+=\ [%{getcwd()}]                              " Current working directory
set statusline+=%=%-14.(%c,%l/%L%V%)\ %p%%                   " Right justified line no, column no, %

set showmode                " Show current mode in cmdline
set showcmd                 " Show typed keys when more are expected

set incsearch               " Incremental search
set hlsearch                " Highlights all matched search
set ignorecase              " Don't worry about casing while searching
set smartcase               " Be smart about casing in search when search is specified with casing

set ttyfast                 " Faster redrawing
set lazyredraw              " Only redraw when necessary

set splitbelow              " Open new window below the current window
set splitright              " Open new window right of the current window

set wrapscan                " Searched wrap around end of file
set nowrap                  " Don't wrap lines if it is longer

set report=0                " Always report changed lines

set noruler                 " Don't display the column no. as it's shown in statusline anyway
set textwidth=180           " Set a higher textwidth

set number                  " Show line numbers
set relativenumber          " Show line number relative to the current line

set clipboard=unnamed,unnamedplus       " Yanking lines gets copied to system clipboard as well

set list                    " Show whitespace characters
" Show the mentioned characters instead of the default
" <C-k>.M for trail
" <C-k>NO for eol
" <C-k>>> for extends
" <C-k><< for precedes
set listchars=tab:>\ ,trail:·,extends:»,precedes:«,eol:¬

set linespace=0             " Set spacing between lines to be 0
set scrolloff=2             " While scrolling pages keep the last 3 lines in context

set autoread                " Read the contents of files if changed outside Vim's context

set mouse=a                 " Use the mouse
set mousehide               " Hide the mouse pointer while typing

"Disable all annoying bells & whistles
set noerrorbells
set novisualbell
set t_vb=

set timeoutlen=300      " Default timeout length to 300 milliseconds
inoremap jk <Esc>
vnoremap jk <Esc>

" Ensure <Up> and <Down> works on the displayed line (in case of wrap being set) instead of actual physical line in the file
nnoremap j gj
nnoremap k gk
" Make Y consistent with C and D
nnoremap Y y$
" Make n always search forward and N backwards
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

packadd! matchit             " Load matchit macro to match html/xml tags with %
set matchpairs+=<:>          " Adding < > as a matching pair when using % key

" Disable all forms of backup, except persistent undo
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~\vim-undo\
set undolevels=1000       " Max number of changes that can be undone
set undoreload=10000      " Max number of lines to save for undo on buffer reload

set autochdir             " Automatically change the pwd to the directory of file where it was opened

set wildmenu              " Command line completion works in enhanced mode 
set wildmode=list:longest   " Menu list works like shell

" Add new filetypes info to Vim
autocmd BufNewFile,BufRead *.*proj set filetype=xml
autocmd BufNewFile,BufRead *.props set filetype=xml
autocmd BufNewFile,BufRead *.targets set filetype=xml
autocmd BufNewFile,BufRead *.config set filetype=xml

" Don't expand tabs on make files
autocmd FileType make setlocal noexpandtab

" Configure space as the leader key
let mapleader=" "

" Vimrc editing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Un-highlight search results
nnoremap <leader><space> :nohl<cr>

" Shortcut to disable set list
nnoremap <leader>li :set list!<cr>

" Shortcut to handle buffers
noremap <leader>bn :bn<cr>
noremap <leader>bp :bp<cr>
noremap <leader>bd :bd<cr>
noremap <leader>bf :bf<cr>
noremap <leader>bl :bl<cr>

" Shortcuts for tab manipulation
noremap <leader>tt :tabnew<cr>
noremap <leader>te :tabedit
noremap <leader>tc :tabclose<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>
noremap <leader>tf :tabfirst<cr>
noremap <leader>tl :tablast<cr>
noremap <leader>tm :tabmove

" Saner cut/copy/paste to work across system apps
noremap YY "+y<cr>
noremap <leader>p "+gP<cr>
noremap XX "+x<cr>

" Open links using leader instead of Ctrl-]
noremap <leader>o <C-]>

" Abbreviation for common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
