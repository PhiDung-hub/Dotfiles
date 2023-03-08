return {
  "famiu/bufdelete.nvim", -- buffer deletetion (default is annoying)
  config = function()
    local status, _ = pcall(require, "bufdelete")
    if not status then
      print("WARNING: Buff delete is unavailable")
      return
    end
    vim.keymap.set("n", "<C-Q>", "<Cmd>Bdelete!<CR>", {})
  end
}
