local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
  "  ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓ ", 
  "  ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ", 
  " ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░ ", 
  " ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██  ", 
  " ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒ ", 
  " ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░ ", 
  " ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░ ", 
  "    ░   ░ ░     ░░   ▒ ░░      ░    ", 
  "          ░      ░   ░         ░    ", 
  "                ░                   ", 
  "                                    ", 
  "                                    ", 
}

g.dashboard_custom_section = {
   a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
   b = { description = { "  Recents Files             SPC f o" }, command = "Telescope oldfiles" },
   c = { description = { "  Recents Projects          SPC p r" }, command = "Telescope projects" },
   d = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
   e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
   f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
}

g.dashboard_custom_footer = {
   "14mth3w0r5t",
}
