vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/kdheepak/lazygit.nvim',
}

vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[G]it', silent = true })
vim.keymap.set('n', '<leader>gf', '<Cmd>LazyGitCurrentFile<CR>', { desc = 'Lazygit current [F]ile dir', silent = true })
