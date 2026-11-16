-- lsp.lua
vim.lsp.config('ts_ls', {
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html"
  }
})
vim.lsp.config('pyright',{
    autoImportCompletions = true,
    indexing = true,
    autoSearchPaths = true,
    useLibraryCodeForTypes = true
})
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.
vim.lsp.enable({
    'lua_ls',
    -- 'jedi_language_server',
    'pyright',
    'ts_ls',
    'clangd',
    'jdtls',
    'html',
    'cssls',
    'harper_ls',
    'intelephense'
})

-- It correctly attaches all your keymaps once a server starts.
vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      -- Create a function that lets us more easily define mappings specific LSP related items.
      -- It sets the mode, buffer and description for us each time.
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<leader>e', vim.diagnostic.open_float,'Hover Error')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        -- etc.
      end,
})
vim.keymap.set("i", "<C-k>", function()
  vim.lsp.buf.signature_help()
end, { desc = "Signature help" })
