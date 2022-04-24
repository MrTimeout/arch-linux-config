" source $HOME/.config/nvim/general/settings.vim
" source $HOME/.config/nvim/vim-plug/plugins.vim
" Number
set number
set relativenumber

" encoding
scriptencoding utf-8
set fileencodings=utf-8,latin

set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab
set nowrap
syntax on

call plug#begin('~/.config/nvim/plugged')

" Vim-airline plugins. They are used to custom the bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Utilities
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'akinsho/bufferline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'

" Git plugins
Plug 'tpope/vim-fugitive' " Git tool inside vim, just amazing.
Plug 'tpope/vim-rhubarb'  " GBrowse to go to the file in Github.
Plug 'mhinz/vim-signify'  " See differences in files with +, - and ~.
Plug 'junegunn/gv.vim'    " This is to see logs of Git repositories.

" Theme plugins
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'

" CodeStats to keep track of the keystrokes that I type
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

call plug#end()

" vim-airline:
" This is used to short the path of the folder to one letter.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])

" Here we set the nvim theme by default.
let g:airline_theme = 'supernova'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_x = airline#section#create_right(['filetype', '', '  ', '%{CodeStatsXp()}'])

" Git configuration
" We are using a low updating time because it is asynchronous
set updatetime=100

" Theme settings. This theme is so awesome.
let g:gruvbox_italic=1 " We must put it before to enforce it.
colorscheme gruvbox

" Setting some git config

" vim-signify plugin
" Changing representation of the line status change
let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '_'
let g:signify_sign_change = '!'

" Setting some safe defaults to not be distracted with numbers:
" this is used to not show the number of the change.
let g:signify_sign_show_count = 0
" this is used to show the text representation of the text.
let g:signify_sign_show_text = 1

" Here we set some mapping keys
" this is used to go to the down hhange in the file.
nmap <leader>gj <plug>(signify-next-hunk)
" this is used to go to the up change in the file
nmap <leader>gk <plug>(signify-prev-hunk)

" Mappings for NERDTree


" vim-rooter
let g:rooter_patterns = ['.git', 'pom.xml', 'pyproject.toml', 'go.mod']

" Setting CodeStats
let g:codestats_api_key = 'SFMyNTY.WlhOMFpXNXZaWE50YVhCMWRHOXViMjFpY21VPSMjT0RJek1RPT0.AkiCMpofbCsLE-g8dPWEb40s0ZUDJ-xUO_ReOOCJmm8'

" Bufferline mapping
lua <<EOF
require("bufferline").setup{}
EOF

nmap <C-N> :enew<CR>
nmap <C-j> :bp<CR>
nmap <C-k> :bn<CR>
nnoremap <C-c> :bp\|bd #<CR>

" nvim lover...
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" resizing windows vertically
nmap <C-h> :vertical resize -4<CR>
nmap <C-l> :vertical resize +4<CR>

" formatting
nmap <silent> nf :Neoformat<CR>

" FZF
nmap <C-p> :FZF<CR>

" Coc customization
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd BufRead,BufNewFile *.yaml.tmpl set filetype=yaml
autocmd BufRead,BufNewFile *.yml.tmpl set filetype=yaml
autocmd BufRead,BufNewFile *.java.tmpl set filetype=java
