return {
  "williamboman/mason.nvim", -- LSP manager.
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- mason config helpers.
  },
  config = function()
    local mason_ok, mason = pcall(require, "mason")
    if not mason_ok then
      print("WARNING: mason is unavailable")
      return
    end

    local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_lspconfig_ok then
      print("WARNING: mason_lspconfig is unavailable")
      return
    end

    -- Available server: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    -- With instruction for config: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local servers = {
      "cssls",
      "emmet_ls",
      "html",
      "jsonls",
      "solc",
      "tsserver",
      "tailwindcss",
      "svelte",
      "pyright",
      "yamlls",
      "bashls",
      "clangd",
      "rust_analyzer",
      "taplo",
      "marksman",
      "prismals",
      "lua_ls",
      "sqlls",
    }

    -- Installing solhint
    -- local registry = require("mason-registry")
    -- for _, pkg_name in ipairs({ "solhint" }) do -- add others here
    --   local ok, pkg = pcall(registry.get_package, pkg_name)
    --   if ok then
    --     if not pkg:is_installed() then
    --       pkg:install()
    --     end
    --   end
    -- end

    mason.setup({})
    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })
  end,
}
