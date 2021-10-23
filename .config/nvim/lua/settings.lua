vim.o.termguicolors = true

vim.g.background = "dark"
vim.cmd[[colorscheme tokyonight]]

vim.o.completeopt = "menuone,noselect"

vim.o.fcs="eob: "
vim.o.encoding = "utf8"
vim.o.mouse = "a"
vim.g.incsearch = true
vim.wo.number = true
vim.o.list = true
vim.opt.listchars = { extends = '›', precedes = '‹', nbsp = '·', trail = '·', tab = '~>', eol = '↲' }

vim.o.clipboard = "unnamed"

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.wo.cursorline = true
vim.cmd[[highlight cursorline ctermbg=none]]
vim.cmd[[highlight cursorlinenr ctermfg=yellow ctermbg=none]]

vim.g.mapleader = " "
vim.g.nofixeol = true -- it doesnt workkkkkkkkkk

-- better backups
vim.cmd[[set noswapfile]]
vim.cmd[[set undofile]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = true,
  }
)
