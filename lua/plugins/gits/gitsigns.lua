return {
  "lewis6991/gitsigns.nvim", -- viewing git
  config = function()
    local status, gitsigns = pcall(require, "gitsigns")
    if not status then
      print("WARNING: gitsigns is unavailable.")
      return
    end

    -- Example config: https://github.com/lewis6991/gitsigns.nvim
    gitsigns.setup({})
  end,
}
