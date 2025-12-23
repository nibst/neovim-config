local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-g>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });
end
,{ desc = 'Telescope project search' })

vim.keymap.set('n', '<leader>gs',builtin.grep_string, {desc = "Telescope grep string"})
vim.keymap.set('n', '<leader>lg',builtin.live_grep, {desc = "Telescope live grep"})
