local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.editor_utils" },
    { import = "plugins.language_server_protocols" },
    { import = "plugins.language_server_protocols.3rd_party_plugins" },
    { import = "plugins.gits" },
    { import = "plugins.aesthetics" },
    { import = "plugins.debuggers" },
  },
})
