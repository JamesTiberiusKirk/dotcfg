vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'folke/tokyonight.nvim'
  use 'rafi/awesome-vim-colorschemes'

  -- dependencies
  use 'nvim-lua/plenary.nvim'

  use 'fatih/vim-go'

  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-telescope/telescope-dap.nvim'


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

  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  -- LSP
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }
  use 'onsails/lspkind.nvim'

  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'


  use 'tpope/vim-fugitive'
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
end)

