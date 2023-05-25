return {
  "tzachar/cmp-tabnine",
  build = "./install.sh",
  dependencies = { "hrsh7th/nvim-cmp" }, -- cmp-tabnine
  config = function()
    local status, tabnine = pcall(require, "cmp_tabnine.config")
    if not status then
      return
    end

    tabnine:setup({
      max_lines = 100,
      max_num_results = 10,
      sort = true,
      run_on_every_keystroke = true,
      snippet_placegolder = "..",
      ignore_file_types = {
        html = true,
      },
      show_prediction_strength = true,
    })
  end,
}
