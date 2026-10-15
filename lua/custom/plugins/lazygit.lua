vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/kdheepak/lazygit.nvim',
}

vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[G]it', silent = true })
vim.keymap.set('n', '<leader>gf', '<Cmd>LazyGitCurrentFile<CR>', { desc = 'Lazygit current [F]ile dir', silent = true })

-- lazygit's nvim-remote edit opens the file via `--remote-tab`, then lazygit.nvim's
-- on_exit jumps back to the window lazygit was launched from. The edit command calls
-- LazygitMarkEdit (see lazygit config.yml) so we can return to the edited file instead.
function _G.LazygitMarkEdit()
  vim.g.lazygit_edit_win = vim.api.nvim_get_current_win()
  return ''
end

vim.g.lazygit_on_exit_callback = function()
  local win = vim.g.lazygit_edit_win
  vim.g.lazygit_edit_win = nil
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_set_current_win(win)
  end
end
