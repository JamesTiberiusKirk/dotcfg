vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  
  -- Theme
  use('folke/tokyonight.nvim')
  use{'rafi/awesome-vim-colorschemes'}

  -- dependencies
  use('nvim-lua/plenary.nvim')
  
  -- nvim-go
  use('crispgm/nvim-go')
  
  -- (optional) if you enable nvim-notify
  use('rcarriga/nvim-notify')
  
  -- (recommend) LSP config
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }


  -- tabs
  use{'kdheepak/tabline.nvim',require = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }}

  -- lualine
  --use{'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  
  -- telescope 
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter'}

  -- nvim-go
  use('crispgm/nvim-go')

  -- (optional) if you enable nvim-notify
  use('rcarriga/nvim-notify')

  -- nim tree
  use {'kyazdani42/nvim-tree.lua',requires = {'kyazdani42/nvim-web-devicons'}}

  -- win resize mode
  use {'simeji/winresizer'}

  -- commenter
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- TODO: need to configure this
  use 'terrortylor/nvim-comment'


  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

end)

