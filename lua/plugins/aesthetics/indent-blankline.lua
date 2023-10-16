return {
  "lukas-reineke/indent-blankline.nvim", -- identation helpers
  main = "ibl",
  config = function()
    local status, ibl = pcall(require, "ibl")
    if not status then
      print("indent blankline not found")
      return
    end

    -- vim.opt.list = true
    -- vim.opt.listchars:append("space:⋅")
    -- vim.opt.listchars:append("eol:↴")

    -- Config: https://github.com/lukas-reineke/indent-blankline.nvim
    ibl.setup({
      indent = {
        char = "▏",
        tab_char = nil,
        smart_indent_cap = true,
        priority = 1,
      },
    })
  end,
}
