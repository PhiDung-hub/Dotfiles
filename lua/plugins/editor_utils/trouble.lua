return {
    "folke/trouble.nvim", -- diagnostics
    enabled = true,
    config = function()
        local status_ok, trouble = pcall(require, "trouble")
        if not status_ok then
            return
        end

        trouble.setup({
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
        })
    end,
}
