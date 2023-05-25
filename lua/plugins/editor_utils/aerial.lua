return {
  "stevearc/aerial.nvim", -- code overview
  config = function()
    local status, aerial = pcall(require, "aerial")
    if not status then
      return
    end

    aerial.setup({
      backends = { "treesitter", "lsp", "markdown" },
      layout = {
        default_direction = "left",
        placement = "window",
        min_width = { 30, 0.1 },
        max_width = { 60, 0.2 },
        width = nil,
      },
      -- Call this function when aerial attaches to a buffer.
      -- Useful for setting keymaps. Takes a single `bufnr` argument.
      on_attach = function(bufnr)
        -- Toggle the aerial window with <leader>a
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
        -- Jump forwards/backwards with '{' and '}'
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>[", "<cmd>AerialPrev<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>]", "<cmd>AerialNext<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "2<leader>[", "<cmd>AerialPrev 2<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "2<leader>]", "<cmd>AerialNext 2<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "3<leader>[", "<cmd>AerialPrev 3<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "3<leader>]", "<cmd>AerialNext 3<CR>", {})
      end,
      -- Determines how the aerial window decides which buffer to display symbols for
      --   window - aerial window will display symbols for the buffer in the window from which it was opened
      --   global - aerial window will display symbols for the current window
      attach_mode = "window",
    })
  end,
}
