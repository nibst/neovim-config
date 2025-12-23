-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'rose-pine/neovim', as = 'rose-pine',
  config = function()
	  vim.cmd('colorscheme rose-pine')
  end
  })
  use({"nvim-treesitter/nvim-treesitter", {branch = 'master', lazy = false,run = ":TSUpdate"}})
  use("ThePrimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use({"mason-org/mason.nvim", config = function()
	  require("mason").setup()
  end})
  use({"neovim/nvim-lspconfig"})
  use {
      "ray-x/lsp_signature.nvim",
  }
  use {
      'hrsh7th/nvim-cmp',
      requires = {
          'hrsh7th/cmp-nvim-lsp',
          'L3MON4D3/LuaSnip',
          'saadparwaiz1/cmp_luasnip'
      }
  }
  use { 'https://github.com/bngarren/checkmate.nvim'}
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}
  use{"folke/which-key.nvim", }
  use {
      'goolord/alpha-nvim',
      requires = {
          'nvim-mini/mini.icons',
          'nvim-lua/plenary.nvim'
      },
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }
  use {
      "folke/persistence.nvim",
      event = "BufReadPre",
      config = function()
          require("persistence").setup({
              options = { "buffers", "curdir", "tabpages", "winsize" },
          })
      end,
  }
end)


