return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2", -- rainbow bracket
    "JoosepAlviste/nvim-ts-context-commentstring", -- tsx/jsx comment helper, use with Comment.nvim
    "windwp/nvim-ts-autotag", -- auto rename tags
  },
  config = function()
    local status, ts = pcall(require, "nvim-treesitter.configs")
    if not status then
      print("WARNING: nvim-treesitter is unavailable.")
      return
    end

    local status2, rainbow = pcall(require, "ts-rainbow")
    if not status2 then
      print("WARNING: ts-rainbow is unavailable.")
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
        "markdown",
        "markdown_inline",
        "javascript",
        "typescript",
        "tsx",
        "solidity",
        "rust",
        "gitignore",
        "lua",
        "cpp",
        "python",
        "toml",
        "json",
        "yaml",
        "css",
        "scss",
        "html",
        "regex",
      },
      autotag = {
        enable = true,
      },
      -- nvim-ts-rainbow plugin: https://github.com/p00f/nvim-ts-rainbow
      rainbow = {
        enable = true,
        query = {
          "rainbow-parens",
          html = "rainbow-tags",
          latex = "rainbow-blocks",
          javascript = "rainbow-tags-react",
          tsx = "rainbow-tags",
        },
        strategy = {
          -- Use global strategy by default
          rainbow.strategy["global"],
          -- Use local for HTML
          html = rainbow.strategy["local"],
          -- Pick the strategy for LaTeX dynamically based on the buffer size
          latex = function()
            -- Disabled for very large files, global strategy for large files,
            -- local strategy otherwise
            if vim.fn.line("$") > 10000 then
              return nil
            elseif vim.fn.line("$") > 1000 then
              return rainbow.strategy["global"]
            end
            return rainbow.strategy["local"]
          end,
        },
        hlgroups = {
          "TSRainbowRed",
          "TSRainbowYellow",
          "TSRainbowBlue",
          "TSRainbowOrange",
          "TSRainbowGreen",
          "TSRainbowViolet",
          "TSRainbowCyan",
        },
        disable = {}, -- list of languages you want to disable the plugin for
      },
      -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
      context_commentstring = {
        enable = true,
        config = {
          -- Default language config: https://github.com/JoosepAlviste/nvim-ts-context-commentstring/blob/main/lua/ts_context_commentstring/internal.lua
        },
        enable_autocmd = false,
      },
    })

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end,
}
