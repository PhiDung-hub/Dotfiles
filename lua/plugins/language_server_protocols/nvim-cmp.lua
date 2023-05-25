return {
  "hrsh7th/nvim-cmp", -- Code Completion.
  dependencies = {
    "onsails/lspkind-nvim", -- vscode-like pictograms.
    "L3MON4D3/LuaSnip", -- https://github.com/L3MON4D3/LuaSnip
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffers (tab)
    "tzachar/cmp-tabnine", -- support for tabnine
    "hrsh7th/cmp-cmdline", -- autocompletion for cmdline
    "zbirenbaum/copilot-cmp", -- support for copilot
  },
  config = function()
    local status, cmp = pcall(require, "cmp")
    local status2, lspkind = pcall(require, "lspkind")
    local status3, luasnip = pcall(require, "luasnip")

    if not (status and status2 and status3) then
      print("WARNING: nvim-cmp | lspkind | luasnip is unavailable.")
      return
    end

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local source_mapping = {
      buffer = "[Buffer]",
      nvim_lsp = "[Nvim_LSP]",
      nvim_lua = "[Lua]",
      cmp_tabnine = "[TabNine]",
      copilot = "[Copilot]",
      path = "[Path]",
    }

    local compare = require("cmp.config.compare")

    ---@diagnostic disable-next-line
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      native_menu = false,
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs( -4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable( -1) then
            luasnip.jump( -1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "cmp_tabnine", group_index = 1 },
        { name = "copilot",     group_index = 2 },
      }),
      formatting = {
        -- Details about function: https://github.com/onsails/lspkind.nvim/blob/master/lua/lspkind/init.lua#L167
        format = lspkind.cmp_format({
          with_text = true,
          max_width = 60,
          before = function(entry, vim_item)
            vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
            vim_item.menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
              local detail = (entry.completion_item.data or {}).detail
              vim_item.kind = ""
              if detail and detail:find(".*%%%.*") then
                vim_item.kind = vim_item.kind .. " " .. detail
              end

              if (entry.completion_item.data or {}).multiline then
                vim_item.kind = vim_item.kind .. " " .. "[MultiLine]"
              end
            end
            local maxwidth = 60
            vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
            return vim_item
          end,
        }),
      },
      sorting = {
        priority_weight = 1,
        comparators = {
          require("cmp_tabnine.compare"),
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    vim.cmd([[
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])
  end,
}
