local status, neodev = pcall(require, "neodev")
if not status then
  print("WARNING: neodev is unavailable")
  return
end

neodev.setup({})
