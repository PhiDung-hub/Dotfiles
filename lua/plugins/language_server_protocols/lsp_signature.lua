return {
  "ray-x/lsp_signature.nvim", -- signature suggestion for lsp.
  config = function()
    local status_ok, signature = pcall(require, "lsp_signature")
    if not status_ok then
      print("WARNING: lsp_signature is unavailable")
      return
    end

    -- See https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
    local cfg = {
      noice = true,
      toggle_key = "<M-x>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
      select_signature_key = "<M-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
      move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
    }

    signature.setup(cfg)
    signature.on_attach(cfg)
  end,
}
