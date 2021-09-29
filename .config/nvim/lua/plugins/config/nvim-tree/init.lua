vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_gitignore = 1

require'nvim-tree'.setup {
  update_focused_file = {
    enable = true
  },
  disable_netrw = true,
  update_cwd = true,
  view = {
    auto_resize = true
  }
}
