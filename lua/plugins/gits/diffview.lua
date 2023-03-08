return { 
  "sindrets/diffview.nvim", 
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local status, diffview = pcall(require, "diffview")
    -- local actions = require("diffview.actions")
    -- DEFAULT SETUP: https://github.com/sindrets/diffview.nvim
    diffview.setup({})
  end
}
