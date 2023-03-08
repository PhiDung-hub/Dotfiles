-- This file is automatically loaded by plugins.config

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.winblend = 0
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- WARNING: MAKE SURE TO PUT ALL CUSTOM HIGHLIGHT AFTER OTHERWISE TOKYONIGHT WILL OVERRIDE
opt.termguicolors = true -- True color support
vim.api.nvim_set_hl(0, "LineNR", { fg = "#DFBB5D" })
vim.api.nvim_set_hl(0, "CursorLineNR", { fg = "cyan", italic = true })

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

opt.hidden = true -- hide abandoned buffer

-- Encodings
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
vim.bo.fileencoding = "utf-8"

vim.wo.relativenumber = false -- set relative number
vim.wo.number = true -- set line number
-- vim.wo.colorcolumn = "150"

-- maintain undo history between sessions
vim.cmd([[set undofile]])

-- Editing settings
opt.tabstop = 2 -- using space`s
opt.softtabstop = 2 -- treat tab in editting as single character
opt.shiftwidth = 2 -- width of A LEVEL OF INDENTATION
opt.smarttab = true -- insert Tab in a blank line will be determined by other places. Backspasce delete shiftwidth
opt.autoindent = true -- New line inherit indentation of previous lines
opt.smartindent = true -- Smart indentation when start a new line (for C-like programs).
opt.expandtab = true -- Use space to insert a tab
opt.wrap = false -- Wrap line when go beyond certain number of characters
opt.backspace = { "start", "eol", "indent" } -- Allow backspacing over everything in insert mode
opt.scrolloff = 10 -- scroll editor when there is x lines left
opt.sidescrolloff = 8 -- Columns of context
opt.completeopt = "menu,menuone,noselect,noinsert"

-- Search
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true -- switch between case-sensitive whenever uppercase letter present
vim.opt.incsearch = true -- incremental search (Default = ON)
vim.opt.hlsearch = true -- Enable search highlighting (Default = ON)

-- Current line
opt.cursorline = true -- Enable highlight cursor line
opt.cursorlineopt = "number,line" -- Include number & whole line

vim.cmd([[set report=5]]) -- report numbers of lines changed if greater than number
