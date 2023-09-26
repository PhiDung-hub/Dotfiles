return {
  "ggandor/leap.nvim", -- vim motion
  dependencies = {
    "tpope/vim-repeat", -- modern '.' repeat command
  },
  config = function()
    local status, leap = pcall(require, "leap")
    if not status then
      print("leap.nvim not found")
      return
    end

    leap.add_default_mappings({})
  end,
}
