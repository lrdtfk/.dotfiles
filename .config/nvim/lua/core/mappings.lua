local map = require("core.utils").map
local cmd = vim.cmd

local M = {}


-- these mappings will only be called during initialization
M.misc = function()
  local function required_mappings()
    -- Don't copy the replaced text after pasting in visual mode
    map("v", "p", '"_dP')

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
    map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
    map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
    map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

    -- use ESC to turn off search highlighting
    map("n", "<Esc>", ":noh <CR>")

    -- yank to end of line
    map("n", "Y", "y$")

    -- keeping the search centered
    map("n", "n", "nzzzv")
    map("n", "N", "Nzzzv")
    map("n", "J", "mzJ`z")

    -- undo break points
    map("i", ",", ",<c-g>u")
    map("i", ".", ".<c-g>u")
    map("i", "!", "!<c-g>u")
    map("i", "?", "?<c-g>u")
    -- extand for more break points

    -- moving text
    map("v", "J", ":m '>+1<CR>gv=gv")
    map("v", "K", ":m '<-2<CR>gv=gv")
    map("i", "<C-j>", "<esc>:m .+1<CR>==")
    map("i", "<C-r>", "<esc>:m .-2<CR>==")
    map("n", "<A-k>", ":m .-2<CR>==")
    map("n", "<A-j>", ":m .+1<CR>==")

    -- No arrow keys
    map("n", "<Up>", "<Nop>")
    map("n", "<Down>", "<Nop>")
    map("n", "<Left>", "<Nop>")
    map("n", "<Right>", "<Nop>")
    map("i", "<Up>", "<Nop>")
    map("i", "<Down>", "<Nop>")
    map("i", "<Left>", "<Nop>")
    map("i", "<Right>", "<Nop>")
    
    -- easier navigation between windows
    map("n", "<C-h>", "<C-w>h")
    map("n", "<C-l>", "<C-w>l")
    map("n", "<C-k>", "<C-w>k")
    map("n", "<C-j>", "<C-w>j")
    
    -- don't yank text on cut ( x )
    -- map({ "n", "v" }, "x", '"_x')

    -- Better indenting
    map("v", "<", "<gv")
    map("v", ">", ">gv")

    -- buffers and tabs related
    map("n", "<leader>x", ":lua require('core.utils').close_buffer() <CR>") -- close  buffer
    map("n", "<C-a>", ":%y+ <CR>") -- copy whole file content
    map("n", "<S-t>", ":enew <CR>") -- new buffer
    map("n", "<C-t>b", ":tabnew <CR>") -- new tabs
    map("n", "<leader>n", ":set nu! rnu! <CR>") -- toggle numbers
    map("n", "<C-s>", ":w <CR>") -- ctrl + s to save file

    -- terminal mappings --
    -- Open terminals
    map("n", "<leader>h", ":ToggleTerm direction=horizontal <CR>")
    map("n", "<leader>v", ":ToggleTerm direction=vertical <CR>")
    map("n", "<leader>w", ":ToggleTerm direction=float <CR>")
    map("n", "<leader>t", ":ToggleTerm direction=tab <CR>")

    -- terminal windows navigation
    map('t', '<C-h>', [[<C-\><C-n><C-W>h]])
    map('t', '<C-j>', [[<C-\><C-n><C-W>j]])
    map('t', '<C-k>', [[<C-\><C-n><C-W>k]])
    map('t', '<C-l>', [[<C-\><C-n><C-W>l]])
    -- terminal mappings end --

    -- Add Packer commands because we are not loading it at startup
    cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
    cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
    cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

    -- nnn
    cmd "silent! command NNN lua require('tools.nnn').nnn_toggle()"
  end

  required_mappings()
end

-- below are all plugin related mappings

M.tabline = function()
  map("n", "<TAB>", ":TablineBufferNext <CR>")
  map("n", "<S-Tab>", ":TablineBufferPrevious <CR>")
end

M.dashboard = function()
  map("n", "<leader>bm", ":DashboardJumpMarks <CR>")
  map("n", "<leader>fn", ":DashboardNewFile <CR>")
  map("n", "<leader>db", ":Dashboard <CR>")
  map("n", "<leader>l", ":SessionLoad <CR>")
  map("n", "<leader>s", ":SessionSave <CR>")
end

M.nvimtree = function()
  map("n", "<C-n>", ":NvimTreeToggle <CR>")
  map("n", "<leader>e", ":NvimTreeFocus <CR>")
end

M.telescope = function()
  map("n", "<leader>fb", ":Telescope buffers <CR>")
  map("n", "<leader>ff", ":Telescope find_files <CR>")
  map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>")
  map("n", "<leader>cm", ":Telescope git_commits <CR>")
  map("n", "<leader>gt", ":Telescope git_status <CR>")
  map("n", "<leader>fh", ":Telescope help_tags <CR>")
  map("n", "<leader>fw", ":Telescope live_grep <CR>")
  map("n", "<leader>fo", ":Telescope oldfiles <CR>")
  map("n", "<leader>pr", ":Telescope projects <CR>")
end

M.telescope_media = function()
  map("n", "<leader>fp", ":Telescope media_files <CR>")
end

return M
