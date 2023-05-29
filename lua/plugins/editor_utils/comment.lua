return {
  "numToStr/Comment.nvim", -- Comment string, enhanced default `gc` behavior.
  dependencies = {
    -- NOTE: HTML and JSX enhancement
    "JoosepAlviste/nvim-ts-context-commentstring", -- tsx/jsx comment helper, use with Comment.nvim
  },
  config = function()
    local status, comment = pcall(require, "Comment")
    if not status then
      print("Comment.nvim not found")
      return
    end

    comment.setup({
      -- Function to call before (un)comment
      -- Support for Comment.nvim: https://github.com/JoosepAlviste/nvim-ts-context-commentstring/blob/main/lua/ts_context_commentstring/integrations/comment_nvim.lua#L20
      ---@return string|nil
      pre_hook = function(ctx)
        local U = require("Comment.utils")

        -- Determine whether to use linewise or blockwise commentstring
        local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

        -- Determine the location where to calculate commentstring from
        local location = nil
        if ctx.ctype == U.ctype.blockwise then
          location = {
            ctx.range.srow - 1,
            ctx.range.scol,
          }
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
          key = type,
          location = location,
        })
      end,
    })
  end,
}
