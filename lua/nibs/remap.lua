
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("i", "<C-c>", "<Esc>")
--move line up
vim.keymap.set("n", "<A-Up>", ":m -2 <CR>")
vim.keymap.set("n", "<A-k>", ":m -2 <CR>")
--move line down
vim.keymap.set("n", "<A-Down>", ":m +1 <CR>")
vim.keymap.set("n", "<A-j>", ":m +1 <CR>")


