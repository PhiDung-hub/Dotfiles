return {
  "windwp/nvim-ts-autotag", -- auto tag
  config = function()
    local status, autotag = pcall(require, "nvim-ts-autotag")
    if (not status) then return end

    autotag.setup({})
  end
}
