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
      undercurl = true, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = true },
      typeStyle = {},
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
    local color_palette = require("kanagawa.colors").setup().palette
    local bg_darker = color_palette.sumiInk2
    local bg_default = color_palette.sumiInk3
    local bg_lighter = color_palette.sumiInk4
    local fg_standout = color_palette.roninYellow
    local fg_dim = color_palette.dragonBlue

    -- WARNING: MAKE SURE TO PUT ALL CUSTOM HIGHLIGHT AFTER OTHERWISE TOKYONIGHT WILL OVERRIDE
    vim.api.nvim_set_hl(0, "LineNR", { fg = fg_dim, bg = bg_default })
    vim.api.nvim_set_hl(0, "CursorLineNR", { fg = fg_standout, bg = bg_default, bold = true })
    vim.api.nvim_set_hl(0, "NoiceCmdline", { bg = bg_lighter, bold = true })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = bg_lighter, bold = true })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = bg_lighter, bold = true })
    vim.api.nvim_set_hl(0, "SagaBorder", { fg = bg_darker, bg = bg_darker })
    vim.api.nvim_set_hl(0, "SagaNormal", { bg = bg_darker })

    -- vim.api.nvim_set_hl(0, "MsgArea", { fg = bg_default })
    -- vim.api.nvim_set_hl(0, "NormalNC", { fg = bg_default })
    -- vim.api.nvim_set_hl(0, "TabLineSel", { fg = bg_default })
    -- vim.api.nvim_set_hl(0, "Winbar", { fg = bg_default })
    -- vim.api.nvim_set_hl(0, "WinbarNC", { fg = bg_default })
  end,
}
