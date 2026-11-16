require('nvim-treesitter').install { 'html', 'javascript', 'php', 'css', "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" }
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'html', 'javascript', 'php', 'css', "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python"},
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
