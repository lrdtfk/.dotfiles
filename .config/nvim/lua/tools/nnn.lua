
local M = {}

local Terminal  = require('toggleterm.terminal').Terminal
local nnn = Terminal:new({ cmd = "nnn", direction = "float" })

M.nnn_toggle = function()
  nnn:toggle()
end

return M
