return {
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup()
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["ggandor/lightspeed.nvim"] = {},
  ["rmagatti/goto-preview"] = {
    config = function()
      require("goto-preview").setup({
        default_mappings = true,
        post_open_hook = function (_, win)
          -- Close the current preview window with <Esc>
          vim.keymap.set(
              'n',
              '<Esc>',
              function()
                  vim.api.nvim_win_close(win, true)
              end,
              { buffer = true }
          )
        end,
      })
    end
  },
  ["smjonas/inc-rename.nvim"] = {
    config = function()
      require("inc_rename").setup()
    end
  },
  ["gbprod/cutlass.nvim"] = {
    config = function()
      require("cutlass").setup({
        cut_key = "d"
      })
    end
  },
  ["zbirenbaum/copilot-cmp"] = {
    after = "nvim-cmp",
  },
  ["zbirenbaum/copilot.lua"] = {
    after = "nvim-cmp",
    event = "InsertEnter",
    config = function()
      vim.defer_fn(function() require("copilot").setup() end, 100)
    end
  },
  -- ["github/copilot.vim"] = {},
}

