return {
  "folke/tokyonight.nvim", -- color theme
  enabled = false,
  config = function()
    local status, tokyonight = pcall(require, "tokyonight")
    if not status then
      print("WARNING: tokyonight color scheme is unavailable.")
      return
    end

    tokyonight.setup({
      style = "night", -- The theme comes in 4 styles, `storm`, `moon`, `night` and `day`
      light_style = "day",
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "night", -- style for floating windows
      },
      sidebars = { "terminal", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      -- You can override specific color groups to use other groups or a hex color
      -- function will be called with a ColorScheme table
      -- See list of color scheme here: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua
      on_colors = function(colors)
        colors.bg = "#17171F"
        colors.bg_dark = "#131317"
        colors.fg = "#c0caf5"
        colors.fg_dark = "#a9b1d6"
        colors.comment = "#565f89"
      end,
      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@diagnostic disable-next-line
      on_highlights = function(highlights, colors) end,
    })

    vim.cmd.colorscheme("tokyonight")

    -- WARNING: MAKE SURE TO PUT ALL CUSTOM HIGHLIGHT AFTER OTHERWISE TOKYONIGHT WILL OVERRIDE
    vim.api.nvim_set_hl(0, "LineNR", { fg = "#5E8B9F" })
    vim.api.nvim_set_hl(0, "CursorLineNR", { fg = "#F4C430", bold = true })
  end,
}
