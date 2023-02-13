local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

-- vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  -- NOTE: For neovim config
  use("wbthomason/packer.nvim") -- plugin manager
  use("nvim-lua/plenary.nvim") -- for lua config
  use("folke/neodev.nvim") --

  -- NOTE: Colormode and status line
  use("folke/tokyonight.nvim") -- color theme
  use("folke/zen-mode.nvim") -- zen mode
  use("folke/twilight.nvim") -- hide out of side code, use with zen mode
  use("nvim-lualine/lualine.nvim") -- Statusline
  use("nvim-colortils/colortils.nvim") -- color utils

  -- NOTE: Comment and utilities
  use("numToStr/Comment.nvim") -- Comment string, enhanced default `gc` behavior.
  use("folke/todo-comments.nvim") -- highlight TODO && other cmts.
  use("rcarriga/nvim-notify") -- notify system

  -- NOTE: Syntax highlighting and code formatting.
  use("nvim-treesitter/nvim-treesitter")
  use("kyazdani42/nvim-web-devicons") -- File icons.
  use("https://github.com/NvChad/nvim-colorizer.lua") -- maintained colorizer
  use("mhartington/formatter.nvim") -- code formatter.
  use("MunifTanjim/nui.nvim") -- ui packageo for neo-tree
  use("p00f/nvim-ts-rainbow") -- rainbow bracket
  use("lukas-reineke/indent-blankline.nvim") -- identation helpers
  use("RRethy/vim-illuminate") -- highligh group & variables

  -- NOTE: HTML and JSX enhancement
  use("windwp/nvim-autopairs") -- auto pairs
  use("windwp/nvim-ts-autotag") -- auto tag
  use("JoosepAlviste/nvim-ts-context-commentstring") -- tsx/jsx comment helper, use with Comment.nvim

  -- NOTE: git utils
  use("lewis6991/gitsigns.nvim") -- viewing git
  use("TimUntersberger/neogit") -- neogit
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

  -- NOTE: editor navigation
  use("phaazon/hop.nvim") -- vim move on stereoid (add more custom mapping).
  -- use("ggandor/leap.nvim") -- Leap like kangaroo
  use("folke/which-key.nvim") -- manage your hotkey on steroid.
  use("stevearc/aerial.nvim") -- code overview
  use("petertriho/nvim-scrollbar") -- scrollview alternative

  -- NOTE: LSP and ít utilities
  use("neovim/nvim-lspconfig") -- official LSP.
  use("onsails/lspkind-nvim") -- vscode-like pictograms.
  use("hrsh7th/nvim-cmp") -- Code Completion.
  use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffers (tab)
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP.
  use("ray-x/lsp_signature.nvim") -- signature suggestion for lsp.
  use("glepnir/lspsaga.nvim") -- LSP UIs
  use("williamboman/mason.nvim") -- LSP manager.
  use("williamboman/mason-lspconfig.nvim") -- mason config helpers.
  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use("folke/trouble.nvim") -- diagnostics
  use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }) -- cmp-tabnine
  use("nvim-pack/nvim-spectre") -- finder

  -- NOTE: Snippets engine
  use("L3MON4D3/LuaSnip") -- https://github.com/L3MON4D3/LuaSnip
  use("saadparwaiz1/cmp_luasnip") -- Use LuaSnip with nvim-cmp https://github.com/saadparwaiz1/cmp_luasnip
  use("rafamadriz/friendly-snippets") -- snippets collection

  -- NOTE: Mark down preview: https://github.com/iamcco/markdown-preview.nvim
  use("iamcco/markdown-preview.nvim")

  -- NOTE: Finder and dir browser
  use("nvim-telescope/telescope.nvim") -- telescope
  use("nvim-telescope/telescope-file-browser.nvim") -- telescope helpers
  use("nvim-telescope/telescope-media-files.nvim") -- preview image
  use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" }) -- superior tree
  use("folke/noice.nvim") -- replaces the UI for messages, cmdline and the popupmenu

  -- NOTE: Terminal & utilities
  use("akinsho/toggleterm.nvim") -- terminal toggler
  use("akinsho/nvim-bufferline.lua") -- buffer navigation on top
  use("famiu/bufdelete.nvim") -- buffer deletetion (default is annoying)
  use("folke/persistence.nvim") -- session manager

  -- NOTE: Code Runners
  use({ "CRAG666/code_runner.nvim", require = "nvim-lua/plenary.nvim" })

  -- Debugger
  --[[ use("mfussenegger/nvim-dap") ]]
  --[[ use("rcarriga/nvim-dap-ui") ]]
  --[[ use("jbyuki/one-small-step-for-vimkind") ]]
  --[[ use("theHamsta/nvim-dap-virtual-text") ]]
  --[[ use("mfussenegger/nvim-dap-python") ]]
end)
