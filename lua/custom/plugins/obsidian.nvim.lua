return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    notes_subdir = 'Zettelkasten',
    new_notes_location = 'notes_subdir',
    disable_frontmatter = true,
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    workspaces = {
      {
        name = 'personal',
        path = '/home/utilitron/Documents/utilitron',
      },
    },
    templates = {
      folder = '--templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {},
    },
    note_id_func = function(title)
      -- Use the title directly, transforming it into a valid file name.
      if title then
        return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        return 'untitled' -- Fallback if title is nil
      end
    end,

    note_path_func = function(spec)
      -- Use the title as the file name.
      local title = spec.title or 'untitled'
      local filename = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower() .. '.md'
      return spec.dir / filename
    end,
  },
  mappings = {
    ['gf'] = {
      action = function()
        return require('obsidian').util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    ['<leader>ch'] = {
      action = function()
        return require('obsidian').util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
    ['<cr>'] = {
      action = function()
        return require('obsidian').util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  },
  keys = {
    { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'New Obsidian note', mode = 'n' },
    { '<leader>oo', '<cmd>ObsidianSearch<cr>', desc = 'Search Obsidian notes', mode = 'n' },
    { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Show location list of backlinks', mode = 'n' },
    { '<leader>ot', '<cmd>ObsidianTemplate<cr>', desc = 'Insert Template', mode = 'n' },
    { '<leader>os', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick Switch', mode = 'n' },
  },
}
