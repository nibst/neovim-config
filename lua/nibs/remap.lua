
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
--move line up
vim.keymap.set("n", "<A-Up>", ":m -2 <CR>")
vim.keymap.set("n", "<A-k>", ":m -2 <CR>")
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

--move line down
vim.keymap.set("n", "<A-Down>", ":m +1 <CR>")
vim.keymap.set("n", "<A-j>", ":m +1 <CR>")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- disable highlight of searched text
vim.keymap.set("n", "<leader>/", ":noh<CR>")

-- edit the nearest <script>...</script> block in a JS/TS scratch buffer
vim.keymap.set("n", "<leader>is", ":InlineScriptEdit<CR>")

vim.keymap.set('n', '<leader>lr', ':LspRestart<CR>', { desc = 'Restart LSP' })

