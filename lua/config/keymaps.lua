-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local map = bind("", { noremap = false })
local nmap = bind("n", { noremap = false })
local noremap = bind("")
local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")
local inoremap = bind("i")

-- Exit terminal mode
vim.api.nvim_set_keymap("t", "<Esc><leader>", [[<C-\><C-n>]], { noremap = true })

-- Visual block mode
nnoremap("q", "<C-v>")

-- Tab
inoremap("<S-tab>", "<C-d>")

-- Go to start and end of line in insert mode.
inoremap("<C-Down>", "<Home>")
inoremap("<C-Up>", "<End>")

-- window and file management
nnoremap("<C-a>", "gg<S-v>G") -- select all
nnoremap("<F3>", "gg=G<C-o>") -- reformat entire file with F3

-- Split window
nnoremap("ss", ":split<CR><C-w>w")
nnoremap("sv", ":vsplit<CR><C-w>w")

-- Move window
nnoremap("zh", "<C-w>h")
nnoremap("zk", "<C-w>k")
nnoremap("zj", "<C-w>j")
nnoremap("zl", "<C-w>l")

-- Copy and paste
-- This is set in window terminal and directly affect neovim
nnoremap("<C-c>", '"+y')
vnoremap("<C-c>", '"+y')

-- Deletion
inoremap("<C-H>", "<C-w>") -- C-H == C-BS https://www.reddit.com/r/neovim/comments/okbag3/comment/h58k9p7/?utm_source=share&utm_medium=web2x&context=3

-- Do, undo.
inoremap("<C-Z>", "<C-O>u")
nnoremap("<C-Z>", "u")
inoremap("<C-Y>", "<C-O><C-R>")

-- press Ctrl-S to save
inoremap("<C-S>", "<ESC>:w<CR>a")
vnoremap("<C-S>", "<ESC>:w<CR>gv")
nnoremap("<C-S>", ":w<CR>")

-- Move lines up and down
nnoremap("<C-m-k>", ":m .-2<CR>==")
vnoremap("<C-m-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-m-k>", ":m '<-2<CR>gv=gv")
nnoremap("<C-m-j>", ":m .+1<CR>==")

-- Using Markdown Preview
nnoremap("<leader>p", ":MarkdownPreview<CR>")
