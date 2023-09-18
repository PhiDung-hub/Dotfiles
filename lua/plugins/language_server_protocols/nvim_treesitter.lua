return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim", -- rainbow bracket: https://github.com/HiPhish/rainbow-delimeters.nvim
    "JoosepAlviste/nvim-ts-context-commentstring", -- tsx/jsx comment helper, use with Comment.nvim
    "windwp/nvim-ts-autotag", -- auto rename tags
    "numToStr/Comment.nvim", -- Comment string, enhanced default `gc` behavior.
  },
  config = function()
    local ts_installed, ts = pcall(require, "nvim-treesitter.configs")
    if not ts_installed then
      print("WARNING: nvim-treesitter is unavailable.")
      return
    end

    -- nvim-ts-rainbow plugin: https://github.com/HiPhish/rainbow-delimiters.nvim
    local rainbow_installed, delimiters = pcall(require, "rainbow-delimiters")
    if not rainbow_installed then
      print("WARNING: ts-rainbow is unavailable.")
      return
    end

    -- nvim-ts-context-commentstring plugin: https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
    local ts_context_installed, _ = pcall(require, "ts_context_commentstring")
    if not ts_context_installed then
      print("WARNING: ts-rainbow is unavailable.")
      return
    end

    -- nvim-ts-autotag plugin: https://github.com/windwp/nvim-ts-autotag
    local autotag_installed, _ = pcall(require, "nvim-ts-autotag")
    if not autotag_installed then
      print("WARNING: nvim-ts-autotag is unavailable")
      return
    end

    -- Comment plugin: https://github.com/numToStr/Comment.nvim
    local comment_installed, comment = pcall(require, "Comment")
    if not comment_installed then
      print("WARNING: Comment.nvim is unavailable")
      return
    end

    ts.setup({
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
        disable = {},
      },
      auto_install = true,
      ensure_installed = {
        "lua",
        "cpp",
        "rust",
        "solidity",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "json",
        "html",
        "css",
        "scss",
        "markdown",
        "markdown_inline",
        "yaml",
        "toml",
        "gitignore",
      },
      autotag = {
        enable = true,
      },
      rainbow = {
        strategy = {
          [""] = delimiters.strategy["global"],
          vim = delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      },
      context_commentstring = {
        enable = true,
        config = {
          -- Default language config: https://github.com/JoosepAlviste/nvim-ts-context-commentstring/blob/main/lua/ts_context_commentstring/internal.lua
        },
        enable_autocmd = false,
      },
    })

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

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end,
}
