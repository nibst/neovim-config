-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', 
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('telescope').setup()
        end
    }
    use({ 'rose-pine/neovim', as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use({"nvim-treesitter/nvim-treesitter", branch = 'main', lazy = false, build = ":TSUpdate"})
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
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use{"folke/which-key.nvim", }
    use {"bngarren/checkmate.nvim",
        config = function()
            require("checkmate").setup()
        end
    }
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
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    use{"jake-stewart/multicursor.nvim",}
    use {'mfussenegger/nvim-jdtls'}
    -- use {
    --     "LunarVim/bigfile.nvim",
    -- }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use { 'windwp/nvim-ts-autotag',
        config = function()
            require("nvim-ts-autotag").setup {}
        end
    }

    use{"catgoose/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
    -- use{"eero-lehtinen/oklch-color-picker.nvim",
    -- config = function()
    --     require("oklch-color-picker").setup()
    -- end
    -- }
    use{"mikavilpas/yazi.nvim",
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("yazi").setup()
        end
    }

    use{
        "3rd/image.nvim",
        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        opts = {
            processor = "magick_cli",
        },
        dependencies = {
            "leafo/magick",
        },
    }
    use { "nvim-tree/nvim-web-devicons",}
end)


