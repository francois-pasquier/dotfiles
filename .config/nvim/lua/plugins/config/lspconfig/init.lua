local nvim_lsp = require('lspconfig')

local root_markers = { ".git/" }

local languages = {}

nvim_lsp.tsserver.setup{}

nvim_lsp.efm.setup {
    init_options = {
      documentFormatting = true
    },
    settings = {
        rootMarkers = root_markers,
        languages = languages
    },
    filetypes = vim.tbl_keys(languages)
}

nvim_lsp.eslint.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
  end;
}

nvim_lsp.stylelint_lsp.setup {
  settings = {
    stylelintplus = {
       autoFixOnSave = true,
       autoFixOnFormat = true
    },
    filetypes = { "css", "less", "postcss", "scss", "sugarss", "vue", "wxss", "jsx", "tsx" }
  }
}
