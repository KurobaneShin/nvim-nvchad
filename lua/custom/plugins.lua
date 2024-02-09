local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ryanoasis/vim-devicons",
  },

  {
    "olexsmir/gopher.nvim",
    config = function()
      require "nvim-lua/plenary.nvim"
      require "nvim-treesitter/nvim-treesitter"

      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "~/go/bin/gotests", -- also you can set custom command path
          impl = "impl",
          iferr = "iferr",
        },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>rb", mode = "n" },
      { "<leader>rbf", mode = "n" },
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
      require("harpoon").setup(opts)
    end,
    keys = {
      { "<leader>a", mode = "n", desc = "Add current file to harpoon" },
      { "C-e", mode = "n", desc = "Open harpoon" },
      {
        "<A-n>",
        mode = "n",
        desc = "Open harpoon and go to first bookmark",
      },
      {
        "<A-m>",
        mode = "n",
        desc = "Open harpoon and go to second bookmark",
      },
      {
        "<A-j>",
        mode = "n",
        desc = "Open harpoon and go to third bookmark",
      },
      {
        "<A-k>",
        mode = "n",
        desc = "Open harpoon and go to fourth bookmark",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    lazy = false,
    opts = function()
      return {
        default_mappings = true, -- disable buffer local mapping created by this plugin
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = "copen", -- command or function to open the conflicts list
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = "DiffAdd",
          current = "DiffText",
        },
      }
    end,
    config = function(_, opts)
      require("git-conflict").setup(opts)
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
          TelescopePrompt = false,
        },
        copilot_node_command = vim.fn.expand "$HOME" .. "/.nvm/versions/node/v19.9.0/bin/node", -- Node.js version must be > 16.x
        server_opts_overrides = {
          trace = "verbose",
          settings = {
            advanced = {
              listCount = 10, -- #completions for panel
              inlineSuggestCount = 3, -- #completions for getCompletions
            },
          },
        },
      }
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
