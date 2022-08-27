vim.g.copilot_assume_mapped = true

vim.opt.clipboard = ""


-- Neovide
vim.g.neovide_transparency = 0.8
vim.g.gui_font_default_size = 12
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "FiraCode Nerd Font"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)

-- Fix paste in neovide
vim.cmd [[
inoremap <d-v> <c-r>+
cnoremap <d-v> <c-r>+
]]

vim.api.nvim_create_user_command('TSInstallAll', ':TSInstall bash c c_sharp cmake comment cpp css dockerfile dot gitignore go graphql html javascript jsdoc json json5 lua make markdown php phpdoc prisma python regex svelte swift toml tsx typescript vim vue yaml zig', {})
