return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "p00f/nvim-ts-rainbow", -- rainbow bracket
    "JoosepAlviste/nvim-ts-context-commentstring", -- tsx/jsx comment helper, use with Comment.nvim
  },
  config = function()
    local status, ts = pcall(require, "nvim-treesitter.configs")
    if not status then
      print("WARNING: nvim-treesitter is unavailable.")
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
        "sql",
        "regex",
      },
      autotag = {
        enable = true,
      },
      -- nvim-ts-rainbow plugin: https://github.com/p00f/nvim-ts-rainbow
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_line = nil,
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

  end
}