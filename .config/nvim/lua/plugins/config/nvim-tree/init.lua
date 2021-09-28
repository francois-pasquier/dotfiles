vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_gitignore = 1

require'nvim-tree'.setup {
  disable_netrw       = true,
  update_cwd          = true,
}
