vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then return tail end
	return string.format("%s\t\t%s", tail, parent)
end
require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        path_display = { "smart "},
        dynamic_preview_title = true,

    },
    pickers = {
        find_files = {
            path_display = filenameFirst,
        }
    }

})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-g>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({search = vim.fn.input("Grep > ") });
end
    ,{ desc = 'Telescope project search' })
vim.keymap.set('n', '<leader>pa', function()
    require('telescope.builtin').find_files({
        hidden = true,
        no_ignore = true
    })
end, { desc = 'Find all files (including hidden/ignored)' })
vim.keymap.set('n', '<leader>gs',builtin.grep_string, {desc = "Telescope grep string"})
vim.keymap.set('n', '<leader>lg',builtin.live_grep, {desc = "Telescope live grep"})

