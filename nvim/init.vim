call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" csv config
autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
autocmd BufWritePre *.csv :%UnArrangeColumn

""""""""""""""""""""
" basic key remaps "
""""""""""""""""""""

nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ;new tab

nnoremap <leader>c :Bdelete<cr>

nnoremap <leader>z zz

let g:winresizer_start_key = "<leader>w"

nnoremap <leader>? :source ~/.config/nvim/init.vim<cr>

nnoremap <c-w>h <c-w>s

" Show substitution
set inccommand=nosplit

" Config for fzf.vim
nnoremap <leader>f :Files<cr>

"inoremap jk <ESC>

"""""""""""""""""""
" general options "
"""""""""""""""""""

set clipboard+=unnamedplus

" no swap file
set noswapfile

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

" set hybrid line number / relative line number
set number relativenumber

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hidden
