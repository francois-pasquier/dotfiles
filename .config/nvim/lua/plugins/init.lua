local execute = vim.api.nvim_command
local fn = vim.fn


local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.api.nvim_command('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when saving plugins.lua

require'plugins.config.lspconfig' -- Linters, formatters

return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use {
      'williamboman/nvim-lsp-installer',
      requires = {'neovim/nvim-lspconfig'}
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'plugins.config.treesitter' end
  }
  use {
    'IndianBoy42/tree-sitter-just', -- Justfile treesitter plugin
    config = function() require'plugins.config/tree-sitter-just' end
  }
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'editorconfig/editorconfig-vim' -- Editorconfig support
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require'plugins.config.lualine' end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require'plugins.config.neogit' end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'plugins.config.nvim-tree' end
  } -- File browser
  use {
    'hrsh7th/nvim-cmp',
    config = function() require'plugins.config.nvim-cmp' end,
    event = 'InsertEnter'
  } -- Completion
  use {'hrsh7th/vim-vsnip', event = 'InsertEnter'} -- VSCode LSP Snippet
  use {"rafamadriz/friendly-snippets", event = "InsertEnter"} -- Preconfigured snippets
  use {
    'onsails/lspkind-nvim',
    config = function() require'plugins.config.lspkind' end
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require'plugins.config.nvim-autopairs' end
  }
  use {
    'karb94/neoscroll.nvim',
    config = function() require'plugins.config.neoscroll' end
  } -- Smooth scroll
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'plugins.config.nvim-colorizer' end,
  } -- Colors highlight
  use {'michaelb/sniprun', run = 'bash ./install.sh'} -- Code runner
  use 'folke/tokyonight.nvim'
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'plugins.config.nvim-bufferline' end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- fzf for telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}},
    config = function() require'plugins.config.telescope' end
  } -- Fuzzy browser
  use {'ggandor/lightspeed.nvim', event = 'BufRead'} -- Ninja moves
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require'plugins.config.todo-comments' end,
    event = 'BufRead'
  }
  use {
    'b3nj5m1n/kommentary',
    config = function() require'plugins.config.kommentary' end
  } -- Commenting
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = 'TroubleToggle',
    config = function() require'plugins.config.trouble' end
  }
  use "Pocco81/TrueZen.nvim" -- Goyo successor
  use 'lambdalisue/suda.vim' -- End the read only nightmare
  use 'jbyuki/instant.nvim' -- Collaboration yeah!
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require'plugins.config.gitsigns' end,
    event = "BufRead"
  }
  use {
    "folke/which-key.nvim",
    config = function() require'plugins.config.which-key' end
  }
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
    disabled = {"nerd-fonts.nvim"}
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = 'markdown'
  }
  use {
    'windwp/nvim-spectre',
    config = function() require'plugins.config.spectre' end,
    event = "BufRead",
  } -- Search and replace
  use {
    "nacro90/numb.nvim",
    config = function() require'plugins.config.numb' end,
    event = "BufRead",
  }
  -- use 'rmagatti/auto-session'
end)
