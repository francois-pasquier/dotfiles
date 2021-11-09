nnoremap('<c-n>', [[:NvimTreeToggle<cr>]])
nnoremap('<leader>r', [[:NvimTreeRefresh<cr>]])
nnoremap('<leader>n', [[:NvimTreeFindFile<cr>]])
nnoremap('<leader><space>', [[:noh<cr>]])

-- Diagnostic
nnoremap('<leader>e', [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>]])
nnoremap('<leader>f', [[<cmd> lua vim.lsp.buf.formatting_seq_sync()<cr>]])
nnoremap('[e', [[<cmd> lua vim.lsp.diagnostic.goto_prev()<cr>]])
nnoremap(']e', [[<cmd> lua vim.lsp.diagnostic.goto_next()<cr>]])

-- Previews
nnoremap('gd', [[<cmd> lua require('goto-preview').goto_preview_definition()<cr>]])
nnoremap('gi', [[<cmd> lua require('goto-preview').goto_preview_implementation()<cr>]])
nnoremap('gP', [[<cmd> lua require('goto-preview').close_all_win()<cr>]])
nnoremap('gr', [[<cmd> lua require('goto-preview').goto_preview_references()<cr>]])

-- Fuzzy searching
nnoremap('<c-p>', [[<cmd>lua require'telescope.builtin'.find_files()<cr>]])
nnoremap('<c-f>', [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]])
nnoremap('<c-b>', [[<cmd>lua require'telescope.builtin'.buffers()<cr>]])
nnoremap('<leader>fh', [[<cmd>lua require'telescope.builtin'.help_tags()<cr>]])

nnoremap('<leader>h', [[<cmd>lua require'hop'.hint_words()<cr>]])

nnoremap('<leader>t', [[<cmd>TroubleToggle<cr>]])

nnoremap('<leader>S', [[<cmd>lua require('spectre').open()<cr>]])
nnoremap('<leader>s', [[<cmd>lua require('spectre').open_visual()<cr>]])
nnoremap('<leader>sp', [[<cmd>lua require('spectre').open_file_search()<cr>]])

nnoremap('<leader>gs', [[<cmd>lua require'neogit'.open()<cr>]])
