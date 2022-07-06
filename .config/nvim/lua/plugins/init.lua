
local present, packer = pcall(require, "plugins.packerInit")

if not present then
  return false
end

local use = packer.use

return packer.startup(function()
  use { "nvim-lua/plenary.nvim" }

  -- packer
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }
  
  -- goyo
  use { "junegunn/goyo.vim" }

  -- tepope
  use { "tpope/vim-repeat" }
  use { "tpope/vim-surround" }
  use { "tpope/vim-fugitive" }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    disable = true,
    run = ':TSUpdate',
    branch = "0.5-compat",
    event = "BufRead",
    config = function() require "plugins.configs.treesitter" end,
  }

  -- lsp
  use { 'williamboman/nvim-lsp-installer' }
  use {
    "neovim/nvim-lspconfig",
    config = function() require "plugins.configs.lspconfig" end,
  }
  use {
    "ray-x/lsp_signature.nvim",
    disable = false,
    after = "nvim-lspconfig",
    config = function() require("plugins.configs.others").signature() end,
  }
  use {
    "glepnir/lspsaga.nvim",
    disable = true,
  }

  -- TODO: what's this
  -- symbols
  use {
    'simrat39/symbols-outline.nvim',
    disable = false,
    config = function() require "plugins.configs.symbols" end,
  }

  --trouble
  use {
    "folke/trouble.nvim",
    disable = true,
    config = function()
      require("trouble").setup{}
    end
  }

  -- load luasnips + cmp related in insert mode only
  use {
    "rafamadriz/friendly-snippets",
    disable = false,
    event = "InsertEnter",
  }
  use {
    "hrsh7th/nvim-cmp",
    disable = false,
    opt = true,
    after = "friendly-snippets",
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function() require "plugins.configs.cmp" end,
  }
  use {
    "L3MON4D3/LuaSnip",
    disable = false,
    after = "nvim-cmp",
    config = function() require("plugins.configs.others").luasnip() end,
  }
  use {
    "windwp/nvim-autopairs",
    disable = false,
    after = "nvim-cmp",
    config = function() require("plugins.configs.others").autopairs() end,
  }

  -- git stuff
  use {
    "lewis6991/gitsigns.nvim",
    disable = false,
    event = "BufRead",
    config = function() require "plugins.configs.gitsigns" end,
    setup = function() require("packer").loader("gitsigns.nvim") end,
    -- TODO: add a condition to load
  }

  -- match
  use {
    "andymass/vim-matchup",
    disable = false,
  }

  -- comment
  use {
    "terrortylor/nvim-comment",
    disable = false,
    config = function() require("plugins.configs.others").comment() end,
  }

  -- terminal
  use {
    "akinsho/toggleterm.nvim",
    disable = false,
    -- TODO: add a command to load
    config = function() require "plugins.configs.terminal" end,
  }

  -- hop
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require'hop'.setup{}
    end
  }

  -- dashboard
  use {
    "glepnir/dashboard-nvim",
    disable = false,
    config = function() require "plugins.configs.dashboard" end,
    setup = function()
      require("core.mappings").dashboard()
    end,
  }

  -- tree
  use {
    "kyazdani42/nvim-tree.lua",
    disable = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function() require "plugins.configs.nvimtree" end,
    setup = function()
      require("core.mappings").nvimtree()
    end,
  }

  -- fzf
  use {
    "junegunn/fzf",
    disable = false,
    run = './install --bin',
  }
  
  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    requires = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
      -- TODO: remove this one 
      {
        "nvim-telescope/telescope-media-files.nvim",
        disable = false,
        setup = function()
          require("core.mappings").telescope_media()
        end,
      },
    },
    config = function() require "plugins.configs.telescope" end,
    setup = function()
      require("core.mappings").telescope()
    end,
  }

  -- project
  use {
    "ahmedkhalf/project.nvim",
    disable = false,
    after = "telescope.nvim",
    config = function() require("plugins.configs.others").project() end,
  }

  -- indent lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    disable = false,
    event = "BufRead",
    config = function() require("plugins.configs.others").blankline() end,
  }

  -- colorscheme
  use { "overcache/NeoSolarized" }

  -- icons
  use { "kyazdani42/nvim-web-devicons" }

  -- statusline and tabline
  use {
    "hoob3rt/lualine.nvim",
    disable = false,
    after = "nvim-web-devicons",
    config = function() require "plugins.configs.statusline" end,
  }
  use {
    'kdheepak/tabline.nvim',
    disable = false,
    after = "lualine.nvim",
    config = function() require "plugins.configs.tabline" end,
    setup = function()
      require("core.mappings").tabline()
    end,
  }

  -- cursorline
  use {
    "yamatsum/nvim-cursorline",
    disable = true,
  }

end)
