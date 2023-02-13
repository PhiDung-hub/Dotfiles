vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
-- vim.opt.pumblend = 5
-- vim.opt.background = 'dark'

vim.cmd([[colorscheme tokyonight]])

-- WARNING: MAKE SURE TO PUT ALL CUSTOM HIGHLIGHT AFTER OTHERWISE TOKYONIGHT WILL OVERRIDE
vim.api.nvim_set_hl(0, "LineNR", { fg = "#DFBB5D" })
vim.api.nvim_set_hl(0, "CursorLineNR", { fg = "cyan", italic = true })
