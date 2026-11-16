vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local ok, persistence = pcall(require, "persistence")
    if ok then
      persistence.save()
    end
  end,
})
