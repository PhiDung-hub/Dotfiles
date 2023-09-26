return {
  "nvim-lualine/lualine.nvim", -- Statusline
  config = function()
    local status, lualine = pcall(require, "lualine")
    if not status then
      print("WARNING: lualine is unavailable")
      return
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "kanagawa",
        section_separators = { left = "", right = "" },
        component_separators = {
          left = "",
          -- right = "",
          right = "|",
        },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        -- lualine_y = {{require('auto-session-library').current_session_name}},
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    })
  end,
}
