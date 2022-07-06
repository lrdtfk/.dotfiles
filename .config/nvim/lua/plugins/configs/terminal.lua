
require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,

  open_mapping = [[<c-\>]],
  hide_numbers = true,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,

  float_opts = {
    border = 'curved',
  }
}

