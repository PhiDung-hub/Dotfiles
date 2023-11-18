return {
  "nvimdev/lspsaga.nvim", -- LSP UIs
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

    vim.keymap.set({ "n", "t" }, "<M-d>", "<cmd>Lspsaga term_toggle<CR>")
  end,
}
