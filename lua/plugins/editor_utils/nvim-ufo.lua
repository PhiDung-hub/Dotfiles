return {
  "kevinhwang91/nvim-ufo", -- code folding
  dependencies = { "kevinhwang91/promise-async" },
  keys = {
    { "za", desc = "Toggle fold under cursor" },
    { "zA", desc = "Toggle all folds under cursor" },
  },
  config = function()
    local status, ufo = pcall(require, "ufo")
    if not status then
      print("WARNING: nvim-ufo is unavailable")
      return
    end

    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
        json = { "array" },
      },
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ("  ... 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            table.insert(newVirtText, chunkText)
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
      open_fold_hl_timeout = 150,
    })
  end,
}
