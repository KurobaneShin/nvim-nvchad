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
      position = "bottom",       -- | top | left | right
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
  copilot_node_command = vim.fn.expand "$HOME" .. "/.nvm/versions/node/v19.9.0/bin/node",       -- Node.js version must be > 16.x
  server_opts_overrides = {
    trace = "verbose",
    settings = {
      advanced = {
        listCount = 10,               -- #completions for panel
        inlineSuggestCount = 3,       -- #completions for getCompletions
      },
    },
  },
}