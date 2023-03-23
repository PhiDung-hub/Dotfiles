return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<M-t>", "<cmd>NeoTreeFocusToggle<cr>", desc = "NeoTree Toggle" },
  },
  config = function()
    local status, neotree = pcall(require, "neo-tree")
    if not status then
      print("WARNING: neo-tree is unavailable")
      return
    end

    -- Config source: https://github.com/nvim-neo-tree/neo-tree.nvim#longer-example-for-packer

    neotree.setup({})

    local nnoremap = require("helpers.keymap").nnoremap
    nnoremap("<M-t>", "<Cmd>NeoTreeFocusToggle<CR>")
  end,
}
