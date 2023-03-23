return {
  "catppuccin/nvim",
  config = function()
    local status, catppuccin = pcall(require, "catppuccin")
    if not status then
      print("WARNING: tokyonight is unavailable.")
      return
    end

    catppuccin.setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })
    vim.cmd.colorscheme("catppuccin")

    -- WARNING: MAKE SURE TO PUT ALL CUSTOM HIGHLIGHT AFTER OTHERWISE TOKYONIGHT WILL OVERRIDE
    vim.api.nvim_set_hl(0, "LineNR", { fg = "#DFBB5D" })
    vim.api.nvim_set_hl(0, "CursorLineNR", { fg = "cyan", italic = true })
  end,
}
