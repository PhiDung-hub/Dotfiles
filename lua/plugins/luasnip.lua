-- https://github.com/L3MON4D3/LuaSnip#config
-- Default: https://github.com/L3MON4D3/LuaSnip/blob/master/lua/luasnip/config.lua#L20
return {
  "L3MON4D3/LuaSnip", -- https://github.com/L3MON4D3/LuaSnip
  denpendencies = {
    "rafamadriz/friendly-snippets", -- snippets collection
  },
  config = function()
    require("luasnip").setup({
      region_check_events = "CursorHold",
      delete_check_events = "TextChanged",
    })

    require("snippets.cpp")
    require("snippets.rust")
  end,
}
