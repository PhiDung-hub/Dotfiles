return {
  "windwp/nvim-autopairs", -- auto pairs
  config = function()
    local status, autopairs = pcall(require, "nvim-autopairs")
    if not status then
      print("WARNING: nvim-autopairs is unavailable")
      return
    end

    autopairs.setup({
      disable_filetype = { "TelescopePrompt", "vim" },
    })
  end
}
