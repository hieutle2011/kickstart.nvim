-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  window = {
    width = 40, -- minimum width
    auto_expand_width = true, -- grow to fit the longest visible name
  },
  -- Only show names (plus git status): drop size, type and timestamp columns
  renderers = {
    directory = {
      { 'indent' },
      { 'icon' },
      { 'current_filter' },
      {
        'container',
        content = {
          { 'name', zindex = 10 },
          { 'symlink_target', zindex = 10, highlight = 'NeoTreeSymbolicLinkTarget' },
          { 'clipboard', zindex = 10 },
          { 'diagnostics', errors_only = true, zindex = 20, align = 'right', hide_when_expanded = true },
          { 'git_status', zindex = 10, align = 'right', hide_when_expanded = true },
        },
      },
    },
    file = {
      { 'indent' },
      { 'icon' },
      {
        'container',
        content = {
          { 'name', zindex = 10 },
          { 'symlink_target', zindex = 10, highlight = 'NeoTreeSymbolicLinkTarget' },
          { 'clipboard', zindex = 10 },
          { 'bufnr', zindex = 10 },
          { 'diagnostics', zindex = 20, align = 'right' },
          { 'git_status', zindex = 10, align = 'right' },
        },
      },
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true, -- highlight the current buffer's file in the tree
      leave_dirs_open = true,
    },
    filtered_items = {
      hide_by_pattern = { '*.js', '*.js.map', '*.d.ts'}, -- press H in the tree to show hidden items again
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
