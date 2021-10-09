local root_markers = { ".git/" }

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  lintStdin = true
}

local languages = {
  javascript = { eslint },
  javascriptreact = { eslint },
  typescript = { eslint },
  typescriptreact = { eslint },
  lua = {
    {
      formatCommand = 'lua-format -i',
      formatStdin = true
    }
  }
}


require "lspconfig".efm.setup {
    init_options = {
      documentFormatting = true
    },
    settings = {
        rootMarkers = root_markers,
        languages = languages
    },
    filetypes = vim.tbl_keys(languages)
}
