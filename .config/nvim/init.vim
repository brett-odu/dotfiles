" Initialize Vim-Plug
call plug#begin('~/.vim/plugged')

" Add plugins here
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" General settings
syntax on
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>

" FZF settings
set rtp+=~/.fzf
command! -bang -nargs=* FindFiles call fzf#vim#files('', {'options': '--layout=reverse'}, <bang>0)

" CoC settings
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-pyright']

