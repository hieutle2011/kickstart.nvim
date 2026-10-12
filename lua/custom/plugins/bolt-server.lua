-- bolt-server.nvim: only load inside the server monorepo checkout.
-- Matches the worktree roots (develop, review, ...) under the bare repo.
local server_root = '/Users/trung.le/code/server'
local cwd = vim.fn.getcwd()
if cwd ~= server_root and not vim.startswith(cwd, server_root .. '/') then return end

vim.pack.add {
  'https://github.com/nvim-telescope/telescope.nvim', -- already installed by init.lua; listed for clarity
  'https://github.com/nvim-telescope/telescope-file-browser.nvim', -- optional
  'git@github.com:bolteu/bolt-server.nvim.git', -- private repo: use SSH
}

local bolt = require 'bolt-server'
bolt.setup {
  -- Optional: force a backend ("telescope" or "snacks")
  picker = 'telescope',
}

local map = function(lhs, fn, desc) vim.keymap.set('n', lhs, fn, { desc = 'Bolt: ' .. desc }) end
map('<Leader>fs', bolt.find_service, 'find service')
map('<Leader>fc', bolt.find_service_comp_tests, 'find comp tests')
map('<Leader>fd', bolt.find_service_db_schema, 'find db schema')
map('<Leader>ss', bolt.find_service_files, 'service files')
map('<Leader>gs', bolt.grep_service_files, 'grep service files')
map('<Leader>cs', bolt.compile_service, 'compile service')
map('<Leader>csf', bolt.compile_service_force, 'compile service (force)')
map('<Leader>cst', bolt.compile_service_with_tests, 'compile service with tests')
map('<Leader>ags', bolt.api_gen_service, 'API gen service')
map('<Leader>cts', bolt.select_comp_test_to_run, 'select comp test')
map('<Leader>cta', bolt.run_service_comp_tests, 'run service comp tests')
map('<Leader>ctb', bolt.run_buffer_comp_tests, 'run buffer comp tests')
map('<Leader>ctc', bolt.run_comp_test_under_cursor, 'run comp test under cursor')
map('<Leader>ctn', bolt.toggle_no_compile_tests, 'toggle no-compile tests')
map('<Leader>gad', bolt.goto_api_definition, 'goto API definition')
map('<Leader>gae', bolt.goto_api_endpoint, 'goto API endpoint')
