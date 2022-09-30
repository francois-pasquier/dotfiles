local M = {}

M.incRename = {
  n = {
    ["<leader>rn"] = {"<ESC>:IncRename ", "Rename"},
  }
}
M.general = {
  n = {
    ["<C-s>"] = { "<cmd>lua vim.lsp.buf.format { async = false } <CR><cmd> w <CR>", "Save file with formatting" },
    ["<2-LeftMouse>"] = { "*" },
    ['<leader><leader>'] = { "<cmd>noh<CR>"},
    ['<leader><S-x>'] = { "%bdelete|edit#|bdelete#", "Close all buffers but this one" },
  },
  i = {
    ["<C-s>"] = { "<cmd>lua vim.lsp.buf.format { async = false } <CR><cmd> w <CR>", "Save file with formatting" },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = {"<cmd>Telescope find_files<CR>", "Telescope: Search for file"},
    ["<C-f>"] = {"<cmd>Telescope live_grep<CR>", "Telescope: Search for text"},
    ["<C-b>"] = {"<cmd>Telescope buffers<CR>", "Telescope: Search for buffer"},
  }
}

return M

