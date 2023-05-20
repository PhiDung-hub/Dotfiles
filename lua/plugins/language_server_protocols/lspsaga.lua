return {
  "glepnir/lspsaga.nvim", -- LSP UIs
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
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
      },
      request_timeout = 3000,
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
