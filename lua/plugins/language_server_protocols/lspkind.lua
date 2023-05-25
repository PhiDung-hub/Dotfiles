return {
  "onsails/lspkind-nvim", -- vscode-like pictograms.
  config = function()
    local status, lspkind = pcall(require, "lspkind")
    if not status then
      print("WARNING: lspkind is unavailable")
      return
    end

    lspkind.init({
      -- enables text annotations
      -- default: true
      mode = "symbol",
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      preset = "default",
      -- override preset symbols
      -- default: {}
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
        Copilot = "",
      },
    })

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  end,
}
