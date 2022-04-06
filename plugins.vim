call plug#begin('~/.nvim/plugged')
  Plug 'tpope/vim-fugitive'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ajmwagar/vim-deus'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'jremmen/vim-ripgrep'
  Plug 'romainl/Apprentice'
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

