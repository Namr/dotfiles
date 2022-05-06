nnoremap <SPACE> <Nop>
let mapleader = " "

set hidden
syntax on
set noswapfile

set ignorecase
set smartcase
set nohlsearch
set incsearch

set exrc
set relativenumber
set nu

set noerrorbells

" I'm a sicko that likes 2 space tabs
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

set scrolloff=8

" Start plugin section
call plug#begin('~/sourceBuilds/vimpluggins')

Plug 'morhetz/gruvbox'

Plug 'prabirshrestha/vim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'ludovicchabant/vim-gutentags'
Plug 'sbdchd/neoformat'

call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox
let g:deoplete#enable_at_startup = 1

" c++ language server configuration
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \   'cache': {'directory': stdpath('cache') . '/ccls' },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

" C++ Tags
let  g:gutentags_ctags_tagfile = '.tags'
let  s:vim_tags = expand('~/.cache/tags')
let  g:gutentags_cache_dir = s:vim_tags
let  g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let  g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let  g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Formatting
" custom setting for C/CPP
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style=file']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

"remappings
inoremap jk <ESC>
nnoremap <leader>ft :Neoformat<CR>

"Format on file save
"augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
"augroup END
