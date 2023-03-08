return {
  "akinsho/toggleterm.nvim", -- terminal toggler
  config = function()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
      print("WARNING: toggle term is unavailable")
      return
    end

    toggleterm.setup({
      size = 30,
      open_mapping = [[<m-0>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "none",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- local Terminal = require("toggleterm.terminal").Terminal
    -- local vertical_term = Terminal:new({
    --   direction = "vertical",
    --   on_open = function(term)
    --     vim.cmd("startinsert!")
    --     vim.api.nvim_buf_set_keymap(
    --       term.bufnr,
    --       "n",
    --       "<m-9>",
    --       "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
    --       { noremap = true, silent = true }
    --     )
    --     vim.api.nvim_buf_set_keymap(
    --       term.bufnr,
    --       "t",
    --       "<m-9>",
    --       "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
    --       { noremap = true, silent = true }
    --     )
    --     vim.api.nvim_buf_set_keymap(
    --       term.bufnr,
    --       "i",
    --       "<m-9>",
    --       "<cmd>2ToggleTerm size=60 direction=vertical<cr>",
    --       { noremap = true, silent = true }
    --     )
    --     vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-3>", "<nop>", { noremap = true, silent = true })
    --   end,
    --   count = 2,
    -- })
    --
    -- function _VERTICAL_TERM()
    --   vertical_term:toggle(150)
    -- end
    --
    -- vim.api.nvim_set_keymap("n", "<m-9>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("i", "<m-9>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })
  end,
}
