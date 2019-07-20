call plug#begin('~/.vim/plugged')

Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-signify'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.hbs set filetype=html
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.tsx set filetype=typescript

let g:signify_vcs_list = ['git']

let g:vim_json_syntax_conceal = 0 
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
" Sets the height for fugitive's git status window.
set previewheight=25

" Underline errors instead of showing big red blocks.
highlight SpellBad ctermbg=NONE ctermfg=NONE cterm=underline

set updatetime=750

" Store swap files all in one folder.  Prevents having to .gitignore and
" prevents webpack watcher from firing as swaps are created.
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

set rtp+=~/.fzf

set completeopt-=preview " Prevent YouCompleteMe from opening a scratch buffer when completing.
set clipboard=unnamed
set smarttab
set ts=2
set sw=2
set background=dark
set backspace=indent,eol,start
set expandtab
set nu
set nocompatible
set hls
set ignorecase
set smartcase
"set so=10
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%{FugitiveStatusline()}%h%m%r%y\ %=%c,%l/%L\ %P\ %{coc#status()}
" Vim replaces files when saving instead of updating them, which breaks docker
" volume mounts when mounting a single file.
set backupcopy=yes
set nomodeline
set list

filetype plugin indent on
syntax on

set relativenumber
autocmd BufEnter * set relativenumber

let mapleader = "\<space>"

nnoremap <Leader>j i<CR><ESC>
nnoremap <C-n> :tabnew<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" Quickfix
nmap <Leader>x <Plug>window:quickfix:toggle

" Better split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=60

" fugitive maps
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>

" Press F4 to toggle highlighting on/off, and show current value
noremap <F4> :set hlsearch! hlsearch?<CR>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

nnoremap <C-p> :FZF<CR>

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki'}]
nnoremap <Leader>+ <Plug>VimwikiAddHeaderLevel
nnoremap <Leader>- <Plug>VimwikiRemoveHeaderLevel

" Tab navigation
nnoremap - :tabprev<CR>
nnoremap = :tabnext<CR>

let g:jsx_ext_required = 0

" coc.nvim config
set cmdheight=2
set hidden

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>] <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(coc-rename)

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nmap <Leader>i <Plug>(coc-fix-current)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab/shift+tab to navigate autocomplete options.
" Below is for deoplete
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Below is for coc.vim.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Open quickfix list in new tab.
autocmd FileType typescript nmap <buffer> <Leader>f :tab copen<CR>

" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors
" colorscheme solarized8_high
