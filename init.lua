local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath }) -- stylua: ignore
end
vim.opt.rtp:prepend(lazypath)

if not pcall(require, "lazy") then
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {}) -- stylua: ignore
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup("plugins")

require "keymaps"
require("dashboard").setup()
require "options"
