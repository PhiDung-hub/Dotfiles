return {
  "glepnir/lspsaga.nvim", -- LSP UIs
  event = "LspAttach",
  branch = "main",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = function()
    local status, saga = pcall(require, "lspsaga")
    if not status then
      return
    end

    -- Setup: https://github.com/glepnir/lspsaga.nvim/blob/main/lua/lspsaga/init.lua
    saga.setup({
      preview = {
        lines_above = 0,
        lines_below = 20,
      },
      scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
      },
      request_timeout = 2000,
      hover = {
        max_width = 0.6,
        open_link = "gx",
        open_browser = "!chrome",
      },
      rename = {
        quit = "<C-c>",
        exec = "<CR>",
        mark = "x",
        confirm = "<CR>",
        in_select = true,
      },
      outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        preview_width = 0.5,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        auto_resize = false,
        custom_sort = nil,
        keys = {
          expand_or_jump = "o",
          quit = "q",
        },
      },
      symbol_in_winbar = {
        enable = true,
        separator = " ",
        ignore_patterns = {},
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
      ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = " ",
        kind = {
          -- See: https://github.com/nvimdev/lspsaga.nvim#custom-kind
          -- 1 -> 9
          ["File"] = { " ", "Tag" },
          ["Module"] = { " ", "Exception" },
          ["Class"] = { "ﴯ ", "Include" },
          ["Method"] = { " ", "Function" },
          ["Property"] = { "ﰠ ", "@property" },
          ["Field"] = { "ﰠ ", "@field" },
          ["Constructor"] = { " ", "@constructor" },

          -- 10 -> 14
          ["Enum"] = { " ", "@number" },
          ["Interface"] = { " ", "Type" },
          ["Function"] = { " ", "Function" },
          ["Variable"] = { " ", "@variable" },
          ["Constant"] = { " ", "Constant" },

          -- 15 -> 21
          ["String"] = { " ", "String" },
          ["Number"] = { " ", "Number" },
          ["Boolean"] = { " ", "Boolean" },
          ["Array"] = { " ", "Type" },
          ["Object"] = { " ", "Type" },
          ["Key"] = { " ", "Constant" },

          -- 22 -> 26
          ["EnumMember"] = { " ", "Number" },
          ["Struct"] = { "פּ ", "Type" },
          ["Event"] = { " ", "Constant" },
          ["Operator"] = { " ", "Operator" },
          ["TypeParameter"] = { " ", "Type" },

          -- ccls: 252 -> 255
          ["TypeAlias"] = { " ", "Type" },
          ["Parameter"] = { "ﰠ ", "@parameter" },
          ["StaticMethod"] = { " ", "Function" },
          ["Macro"] = { " ", "Macro" },

          -- 300 -> 304
          ["Text"] = { " ", "String" },
          ["Folder"] = { " ", "Title" },
          ["Unit"] = { "塞", "Number" },
          ["Value"] = { " ", "@variable" },
        },
      },
    })

    local nnoremap = require("helpers.keymap").nnoremap

    -- Common use cases.
    nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
    nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>")
    nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")
    nnoremap("gr", "<Cmd>Lspsaga rename<CR>")
    nnoremap("gd", "<Cmd>Lspsaga goto_definition<CR>")

    -- Outline && call orders
    nnoremap("<leader>o", "<Cmd>Lspsaga outline<CR>")
    nnoremap("<leader>ci", "<Cmd>Lspsaga incoming_calls<CR>")
    nnoremap("<leader>co", "<Cmd>Lspsaga outgoing_calls<CR>")

    -- diagnostics
    nnoremap("<leader>sl", "<Cmd>Lspsaga show_line_diagnostics<CR>")
    nnoremap("<leader>sc", "<Cmd>Lspsaga show_cursor_diagnostics<CR>")
    nnoremap("<leader>sb", "<Cmd>Lspsaga show_buf_diagnostics<CR>")
    nnoremap("<leader>[e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
    nnoremap("<leader>]e", "<Cmd>Lspsaga diagnostic_jump_next<CR>")

    vim.keymap.set({ "n", "t" }, "<M-d>", "<cmd>Lspsaga term_toggle<CR>")

    -- NOTE: HIGHLIGHT GROUP: https://github.com/glepnir/lspsaga.nvim/blob/main/lua/lspsaga/highlight.lua
    local set_highlight = vim.api.nvim_set_hl
    set_highlight(0, "SagaBorder", { fg = "#6DD2DD", bg = "#222222" })
    set_highlight(0, "SagaNormal", { bg = "#222222" })
  end,
}
