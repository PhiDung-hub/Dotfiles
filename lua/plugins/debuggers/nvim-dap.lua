local status, dap = pcall(require, "dap")
-- Debugger
--[[ use("mfussenegger/nvim-dap") ]]
--[[ use("rcarriga/nvim-dap-ui") ]]
--[[ use("jbyuki/one-small-step-for-vimkind") ]]
--[[ use("theHamsta/nvim-dap-virtual-text") ]]
--[[ use("mfussenegger/nvim-dap-python") ]]
if not status then
  return
end
