local status, notify = pcall(require, "notify")

if not status then
  print("WARNING: nvim-notify unavailable")
  return
end

notify.setup({
  stages = "fade_in_slide_out",
  background_colour = "FloatShadow",
  timeout = 2000,
})
vim.notify = notify
