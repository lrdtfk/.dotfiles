require'lualine'.setup {
  options = {
    theme = 'solarized_dark',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        symbols = {error = ' ', warn = ' ', info = ' '},
      },
      {
        'diff',
        symbols = {added = ' ', modified = '柳 ', removed = ' '},
      }
    },
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {
    'quickfix', 'nvim-tree', 'fzf', 'fugitive'
  }
}
