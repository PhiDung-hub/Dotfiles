return {
  "rebelot/kanagawa.nvim", -- color theme
  enabled = true,
  config = function()
    local status, kanagawa = pcall(require, "kanagawa")
    if not status then
      print("WARNING: kanagawa color scheme is unavailable.")
      return
    end

    kanagawa.setup({
      compile = false, -- enable compiling the colorscheme
      undercurl = false, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = true, italic = false },
      variablebuiltinStyle = { italic = false },
      typeStyle = { italic = false },
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        -- Complete pallete: https://github.com/rebelot/kanagawa.nvim#color-palette
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          Italic = { italic = false },
          Special = { italic = false },
        }
      end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    })

    vim.cmd.colorscheme("kanagawa")

    -- Complete pallete: https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/colors.lua
    local palette = require("kanagawa.colors").setup().palette
    local bg_darker = palette.sumiInk2
    local bg_default = palette.sumiInk3
    local bg_lighter = palette.sumiInk4
    local fg_standout = palette.roninYellow
    local fg_dim = palette.dragonBlue

    -- WARNING: MAKE SURE TO PUT ALL CUSTOM HIGHLIGHT AFTER OTHERWISE TOKYONIGHT WILL OVERRIDE

    -- Editor line number
    vim.api.nvim_set_hl(0, "LineNR", { fg = fg_dim, bg = bg_default })
    vim.api.nvim_set_hl(0, "CursorLineNR", { fg = fg_standout, bg = bg_default, bold = true })

    -- sign column
    vim.api.nvim_set_hl(0, "SignColumn", { bg = bg_default })
    vim.api.nvim_set_hl(0, "DiffviewSignColumn", { bg = bg_default })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = bg_default })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = palette.autumnRed, bg = bg_default })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = palette.autumnYellow, bg = bg_default })
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = palette.autumnGreen, bg = bg_default })

    -- noice
    vim.api.nvim_set_hl(0, "NoiceCmdline", { bg = bg_lighter, bold = true })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = bg_lighter, bold = true })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = fg_dim, bold = true })
    vim.api.nvim_set_hl(0, "SagaBorder", { fg = bg_lighter, bg = bg_darker })
    vim.api.nvim_set_hl(0, "SagaNormal", { bg = bg_darker })
  end,
}
