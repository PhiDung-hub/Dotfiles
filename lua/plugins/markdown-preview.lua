-- Setup references: https://github.com/iamcco/markdown-preview.nvim#markdownpreview-config
return {
  -- NOTE: Mark down preview: https://github.com/iamcco/markdown-preview.nvim
  "iamcco/markdown-preview.nvim",
  config = function()
    -- auto close current preview window when change to another buffer
    vim.g.mkdp_auto_close = 0
  end
}
