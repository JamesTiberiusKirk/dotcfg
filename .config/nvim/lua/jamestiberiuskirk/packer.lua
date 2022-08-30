vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- Theme
  use 'folke/tokyonight.nvim'
  use 'rafi/awesome-vim-colorschemes'

  -- dependencies
  use 'nvim-lua/plenary.nvim'
  
  use 'crispgm/nvim-go'
  --use 'ray-x/go.nvim'
  --use {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}


  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use 'nvim-treesitter/nvim-treesitter'
  use 'rcarriga/nvim-notify'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  use  'simeji/winresizer'

  -- commenter
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'terrortylor/nvim-comment'


  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  --use({
  --  'ray-x/navigator.lua',
  --  requires = {
  --    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  --    { 'neovim/nvim-lspconfig' },
  --  },
  --})
end)

