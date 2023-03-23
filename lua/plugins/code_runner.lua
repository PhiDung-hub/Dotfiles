return {
  "CRAG666/code_runner.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>r", "<cmd>RunCode<CR>", desc = "Run code in this file" },
  },
  opts = {
    filetype = {
      python = "python3 -u",
      rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
      c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
      cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    },
    -- choose default mode (valid term, tab, float, toggle, buf)
    mode = "float",
    -- Focus on runner window(only works on toggle, term and tab mode)
    focus = true,
    float = {
      -- Window border (see ':h nvim_open_win')
      border = "rounded",

      -- Num from `0 - 1` for measurements
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,

      -- Highlight group for floating window/border (see ':h winhl')
      border_hl = "FloatBorder",
      float_hl = "Normal",

      -- Transparency (see ':h winblend')
      blend = 20,
    },
    keys = {
      { "<leader>r", "<cmd>RunCode<CR>", desc = "Run code in this file" },
    },
    project = {},
  },
}
