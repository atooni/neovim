call plug#begin('~/.nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
  Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
  Plug 'tpope/vim-fugitive'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ajmwagar/vim-deus'
  Plug 'jremmen/vim-ripgrep'
  Plug 'romainl/Apprentice'
call plug#end()
