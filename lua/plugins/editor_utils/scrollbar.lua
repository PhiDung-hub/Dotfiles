return {
  "petertriho/nvim-scrollbar", -- scrollview alternative
  enabled = false,
  config = function()
    local status, scrollbar = pcall(require, "scrollbar")
    if not status then
      return
    end

    -- local colors = require("kanagawa.colors").setup()

    -- scrollbar settings: https://github.com/petertriho/nvim-scrollbar#config
    scrollbar.setup({
      -- handle = {
      --   color = colors.bg_highlight,
      -- },
      -- marks = {
      --   Search = { color = colors.orange },
      --   Error = { color = colors.error },
      --   Warn = { color = colors.warning },
      --   Info = { color = colors.info },
      --   Hint = { color = colors.hint },
      --   Misc = { color = colors.purple },
      -- },
    })
  end,
}
