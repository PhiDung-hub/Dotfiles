return {
  "RRethy/vim-illuminate", -- highligh group & variables
  config = function()
    local status, _ = pcall(require, "illuminate")
    if not status then
      print("WARNING: illumininate is unavailable")
      return
    end
  end
}
