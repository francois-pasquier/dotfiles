-- overriding default plugin configs!

local M = {}

M.mason = {
  ensure_installed = {
    -- devops
    "ansible-language-server",

    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "cucumber-language-server",
    "deno",
    "emmet-ls",
    "eslint-lsp",
    -- "eslint_d",
    "html-lsp",
    "intelephense",
    "json-lsp",
    "phpactor",
    "prettierd",
    "prisma-language-server",
    "pylint",
    -- "python-lsp-server", gcc wrong path error
    "stylelint-lsp",
    "svelte-language-server",
    "typescript-language-server",
    "vue-language-server",
    "yaml-language-server",

    -- shell
    "shellcheck",
  },
}

M.cmp = function()
  local cmp = require "cmp"

  return {
    -- mapping = {
    --   ["<CR>"] = cmp.mapping.confirm {
    --     select = true
    --   }
    -- },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "copilot", group_index = 2 },
    },
    formatting = {
      format = function(entry, vim_item)
        if entry.source.name == "copilot" then
           vim_item.kind = "[] Copilot"
           vim_item.kind_hl_group = "CmpItemKindCopilot"
           return vim_item
        end

        local icons = require("nvchad_ui.icons").lspkind
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        return vim_item
      end,
    },
  }
end

return M

