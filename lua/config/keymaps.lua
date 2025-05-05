-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- map({ "i", "n", "v" }, "<A-j>", "")
-- map({ "i", "n", "v" }, "<A-k>", "")
-- map({ "i", "n", "v" }, "<A-h>", "")
-- map({ "i", "n", "v" }, "<A-l>", "")

map("n", "<C-u>", "<C-u>zz", { desc = "Move view up" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move view down" })
