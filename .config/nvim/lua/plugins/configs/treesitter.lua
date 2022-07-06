
--TODO: read more on treesitter and try improve this configuration
local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

ts_config.setup {
  ensure_installed = { 
    "bash",
    "c",
    "cpp",
    "cmake",
    "python",
    "javascript",
    "jsdoc",
    "json",
    "php", 
    "dockerfile",
    "vim",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

}

-- this doesn't work properly
-- vim.cmd([[set foldmethod=expr]])
-- vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
