return {
  "L3MON4D3/LuaSnip", -- https://github.com/L3MON4D3/LuaSnip
  tag = "v2.2.0",
  enabled = false,
  -- denpendencies = {
  --   "rafamadriz/friendly-snippets", -- snippets collection
  -- },
  -- Default: https://github.com/L3MON4D3/LuaSnip/blob/master/lua/luasnip/config.lua#L20
  config = function()
    require("luasnip").setup({})

    -- require("snippets.cpp")
    -- require("snippets.rust")
  end,
}
