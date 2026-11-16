vim.keymap.set("n", "<leader>-", function()
  require("yazi").yazi()
end,
{desc="Open yazi file manager"})
-- This below makes so that we open with yazi on 'nvim .' instead of netwr (default)
-- 👇 if you use `open_for_directories=true`, this is recommended.
--
-- mark netrw as loaded so it's not loaded at all.
-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
-- vim.g.loaded_netrwPlugin = 1
-- vim.api.nvim_create_autocmd("UIEnter", {
--   callback = function()
--     require("yazi").setup({
--       open_for_directories = true,
--     })
--   end,
-- })




