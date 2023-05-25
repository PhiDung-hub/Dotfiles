return {
  "TimUntersberger/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  config = function()
    local status, neogit = pcall(require, "neogit")
    if not status then
      print("WARNING: neogit is unavailable.")
      return
    end
    -- See here: https://github.com/TimUntersberger/neogit
    neogit.setup({
      integrations = {
        diffview = true,
      },
    })
  end,
}
