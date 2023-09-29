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

    local s, context = pcall(require, "ts_context_commentstring")
    if not s then
      print("ts_context_commentstring not found")
      return
    end
    -- NOTE: for nvim-treesitter v1.0
    -- context.setup({})

    comment.setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
