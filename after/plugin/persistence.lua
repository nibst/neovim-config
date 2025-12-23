vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("persistence").save()
  end,
})
