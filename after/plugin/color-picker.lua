
vim.keymap.set('n', '<leader>v',function() require("oklch-color-picker").pick_under_cursor() end
, {desc = "Color pick under cursor"})
vim.keymap.set('n', '<leader>cp',
function() require("oklch-color-picker").open_picker() end,
{desc="Open color picker"})

