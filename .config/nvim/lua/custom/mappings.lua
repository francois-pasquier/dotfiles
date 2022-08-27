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
  },
  i = {
    ["<C-s>"] = { "<cmd>lua vim.lsp.buf.format { async = false } <CR><cmd> w <CR>", "Save file with formatting" },
    -- ["<c-v>"] = { "+p" },
    -- ["<d-v>"] = { "+p" },
    -- ["<C-v>"] = { "<cmd> +p <CR>" },
    -- ["<D-v>"] = { "<cmd> +p <CR>" },
    --
    --     ["<C-c>"] = { "<cmd> %y+ <CR>", "  copy whole file" },
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

