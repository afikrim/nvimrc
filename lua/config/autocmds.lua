-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Open your LazyVim config file (usually init.lua) and add the following:
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("go_indent"),
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4 -- Number of spaces tabs count for
    vim.opt_local.shiftwidth = 4 -- Number of spaces for each indentation level
    vim.opt_local.expandtab = false -- Use tabs instead of spaces
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.http",
  command = "set filetype=http",
  group = augroup("filetype_http"),
})
