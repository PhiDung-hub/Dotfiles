local status, illuminate = pcall(require, "illuminate")
if not status then
  print("WARNING: illumininate is unavailable")
  return
end
