local status, spectre = pcall(require, "spectre")
if not status then
  print("WARNING: spectre is unavailable")
  return
end

spectre.setup()
