return {
  "glepnir/lspsaga.nvim", -- LSP UIs
  config = function()
    local status, saga = pcall(require, "lspsaga")
    if not status then
      return
    end

    -- Setup: https://github.com/glepnir/lspsaga.nvim/blob/main/lua/lspsaga/init.lua
    saga.setup({
      ui = {
        theme = "round",
        -- this option only work in neovim 0.9
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = "rounded",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = "👀 ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        kind = {},
      },
      diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        keys = {
          exec_action = "o",
          quit = "q",
          go_action = "g",
        },
      },
      code_action = {
        num_shortcut = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
      lightbulb = {
        enable = true,
        enable_in_insert = true,
        -- cache_code_action = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      preview = {
        lines_above = 0,
        lines_below = 10,
      },
      scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
      },
      request_timeout = 3000,
      finder = {
        edit = { "o", "<CR>" },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { "q", "<ESC>" },
      },
      definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
        close = "<Esc>",
      },
      rename = {
        quit = "<C-c>",
        exec = "<CR>",
        mark = "x",
        confirm = "<CR>",
        in_select = true,
      },
      symbol_in_winbar = {
        enable = true,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
      outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
          jump = "o",
          expand_collapse = "u",
          quit = "q",
        },
      },
      callhierarchy = {
        show_detail = false,
        keys = {
          edit = "e",
          vsplit = "s",
          split = "i",
          tabe = "t",
          jump = "o",
          quit = "q",
          expand_collapse = "u",
        },
      },
      -- If you don't use nvim-lspconfig you must pass your server name and the related
      -- filetypes into this table like server_filetype_map = { metals = { "sbt", "scala" } }
      server_filetype_map = {},
    })

    local nnoremap = require("helpers.keymap").nnoremap

    -- Common use cases.
    nnoremap("K", "<cmd>Lspsaga hover_doc<CR>")
    nnoremap("gd", "<cmd>Lspsaga lsp_finder<CR>")
    nnoremap("gp", "<cmd>Lspsaga peek_definition<CR>")
    nnoremap("gr", "<Cmd>Lspsaga rename<CR>")

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

