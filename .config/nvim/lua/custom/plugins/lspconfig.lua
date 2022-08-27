local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
  "ansiblels",
  "cssls",
  "cucumber_language_server",
  -- "denols",
  "eslint",
  "html",
  "intelephense",
  "jsonls",
  "phpactor",
  "prismals",
  -- "stylelint_lsp",
  "svelte",
  "sumneko_lua",
  "tsserver",
  "volar",
  "yamlls",
  -- "zls"
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false
})
