require("config.autocmds")
require("config.options")
require("config.keymaps")
require("plugins")

local has = vim.fn.has

local is_mac = has("macunix")
local is_win = has("win32") or has("wsl")

if is_mac then
  require("macos")
end

if is_win then
  require("windows")
end
