return {
  "folke/noice.nvim", -- replaces the UI for messages, cmdline and the popupmenu
  -- enabled = false,
  config = function()
    local status, noice = pcall(require, "noice")
    if not status then
      print("WARNING: noice is unavailable")
      return
    end

    -- Setup: https://github.com/folke/noice.nvim
    noice.setup({
      lsp = {
        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          enabled = false,
        },
      },
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      -- you can enable a preset by setting it to true, or a table that will override the preset config
      -- you can also add custom presets that you can enable/disable with enabled=true
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    })
  end,
}
