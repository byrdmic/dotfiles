call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Collection of snippets
    Plug 'honza/vim-snippets'

    " Compiler and linter
    Plug 'neomake/neomake'

    " Theme gruvbox
    Plug 'morhetz/gruvbox'

    " Status bar
    Plug 'itchyny/lightline.vim'

    " tmux
    Plug 'wellle/tmux-complete.vim'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'christoomey/vim-tmux-navigator'

    " Man pages in Neovim
    Plug 'jez/vim-superman'

    " NerdTree
    Plug 'preservim/nerdtree'

    " vim-surround
    Plug 'tpope/vim-surround'

    " Syntax highlighting
    Plug 'mboughaba/i3config.vim'
    Plug 'whatyouhide/vim-tmux-syntax'

    " Commenting
    Plug 'tpope/vim-commentary'
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

" NerdTree keys
nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<cr>

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

"""""""""""
" coc.vim "
"""""""""""

" Coc extensions
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-json',
            \]

" This is a very basic configuration

" TextEdit might fail if hidden is not set
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.vim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""""""""""
" Neomake "
"""""""""""

" Neomake signs in the gutter
let g:neomake_error_sign = {'text': '', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
            \   'text': '',
            \   'texthl': 'NeomakeWarningSign',
            \ }
let g:neomake_message_sign = {
            \   'text': '',
            \   'texthl': 'NeomakeWarningSign',
            \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" update neomake when save file
call neomake#configure#automake('w')

command! -bang -nargs=* -complete=file Make NeomakeProject <args>

" Enable linters
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_sh_enabled_makers = ['vint']

"""""""""""
" Gruvbox "
"""""""""""

autocmd vimenter * ++nested colorscheme gruvbox

"""""""""""""
" lightline "
"""""""""""""

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

