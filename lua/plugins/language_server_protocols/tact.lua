return {
  "tact-lang/tact.vim",
  config = function()
    vim.g.tact_prefer_completefunc = 1
    vim.g.tact_style_guide = 1
    vim.g.tact_blank_identifiers = 0
    -- Autocmd to set keymap for tact files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tact",
      callback = function()
        vim.keymap.set("n", "<leader>f", ":TactFmt<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>cc", ":TactFmt<CR>", { noremap = true, silent = true })
      end,
    })
  end,
}
