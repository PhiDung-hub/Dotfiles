return {
  "neovim/nvim-lspconfig",  -- https://github.com/neovim/nvim-lspconfig
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in LSP.
  },
  config = function()
    local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_ok then
      print("WARNING: lspconfig is unavailable")
      return
    end

    local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if not cmp_nvim_lsp_ok then
      print("WARNING: cmp_nvim_lsp is unavailable")
      return
    end
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
      -- Mappings.
      local opts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    -- Set up completion using nvim_cmp with LSP source
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- markdown
    lspconfig.marksman.setup({
      on_attach = on_attach,
      filetypes = { "markdown", "markdown.mdx" },
      capabilities = capabilities,
    })

    -- jsx/tsx/svelte/vue
    lspconfig.tsserver.setup({
      on_attach = on_attach,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      capabilities = capabilities,
    })

    lspconfig.svelte.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.vue.setup({
      on_attach = on_attach,
      filetypes = {
        "vue",
      },
      capabilities = capabilities,
    })

    -- html & css & Tailwindcss
    lspconfig.emmet_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "htmldjango", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L284
            ["bem.enabled"] = true,
            ["jsx.enabled"] = true,
          },
        },
      },
    })
    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- RUST
    -- rustfmt formatting: https://rust-lang.github.io/rustfmt/?version=v1.5.1&search
    -- rust_analyzer config: https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabiligies = capabilities,
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
          },
        },
      },
    })

    -- TOML
    lspconfig.taplo.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- JSON
    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- cpp
    local clangd_cap = capabilities
    clangd_cap.textDocument.semanticHighlighting = true
    clangd_cap.offsetEncoding = "utf-16"
    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = clangd_cap,
      cmd = {
        "clangd",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--suggest-missing-includes",
        "--cross-file-rename",
        "--completion-style=detailed",
      },
    })

    -- Python
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Solidity
    lspconfig.solidity_ls_nomicfoundation.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- SQL
    lspconfig.sqlls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.prismals.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
    local enable_format_on_save = function(_, bufnr)
      vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end

    -- lua & neovim
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      single_file_support = true,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = { spacing = 4, prefix = "" },
      severity_sort = true,
    })

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      float = {
        source = "if_many", -- Or "if_many"
      },
    })
  end,
}
