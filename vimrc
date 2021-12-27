call plug#begin('~/.vim/plugged')
	" For files
	"plug 'preservim/nerdtree'
	"Plug 'Xuyuanp/nerdtree-git-plugin'
	"Plug 'ryanoasis/vim-devicons'
	"Status bar
	"Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
	 Plug 'itchyny/lightline.vim'
	" Theme
	Plug 'morhetz/gruvbox'
	" For autocompletion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

colorscheme gruvbox
set encoding=utf-8
set hidden	
set updatetime=300 
set number	
set belloff=all	
set tabstop=4
set shiftwidth=4
set autoindent	
set incsearch
set hlsearch
set nocompatible "For ultisnips
set background=dark
set nowrap
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir

"Hide tildes on blanck lines
highlight EndOfBuffer ctermfg=bg

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

"Open a terminal 
nmap <space>tt :below vertical terminal ++cols=65 <CR>

"Resize windows
nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

"Netrw file browser
let g:netrw_banner = 0
let g:netrw_winsize = 15

"" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Make <TAB> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

