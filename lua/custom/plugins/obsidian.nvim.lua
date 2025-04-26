return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    disable_frontmatter = true,
    workspaces = {
      {
        name = 'personal',
        path = '/home/utilitron/Documents/utilitron',
      },
    },

    -- see below for full list of options 👇
  },
  keys = {
    { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'New Obsidian note', mode = 'n' },
    { '<leader>oo', '<cmd>ObsidianSearch<cr>', desc = 'Search Obsidian notes', mode = 'n' },
    { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Show location list of backlinks', mode = 'n' },
    { '<leader>ot', '<cmd>ObsidianTemplate<cr>', desc = 'Insert Template', mode = 'n' },
  },

  templates = {
    folder = 'home/utilitron/Documents/utilitron/--templates',
    date_format = '%Y-%m-%d-%a',
    time_format = '%H:%M',
  },
}
