-- Installed path at ~/.local/share/nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- Ensure packer has installed successfully

-- Autocmd reloads nvim after this file saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Initialize and startup
local status, packer = pcall(require, 'packer')
if not status then
  print('Pakcer is not installed')
  return
end

return packer.startup(function(use)
  -- essential
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')

  -- colorscheme
  use('ellisonleao/gruvbox.nvim')

  -- accessible
  use('tpope/vim-surround')
  use('vim-scripts/ReplaceWithRegister')
  use('numToStr/Comment.nvim')
  use('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
  use('nvim-lualine/lualine.nvim')
  use('mg979/vim-visual-multi')

  -- nvim-tree
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
    tag = 'nightly'
  })

  -- fuzzy finding !!TELESCOPE!!
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }) -- improve performance
  use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' })

  -- LSP/DAP servers manager !!MASON!!
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use({
    'neovim/nvim-lspconfig',
    requires = {
      -- LSP configuration
      'hrsh7th/cmp-nvim-lsp',
      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  })
  use({ 'nvimdev/lspsaga.nvim', after = 'nvim-lspconfig' })

  -- Awesome language parser for syntax highlight, auto-editing, code navigation and so on !!TREESITTER!!
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end
  })

  -- autocompletion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- lua snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  })
  use('windwp/nvim-autopairs')

  -- Git
  use('lewis6991/gitsigns.nvim')

  -- Rust
  use({
    'rust-lang/rust.vim',
    ft = 'rust',
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  })
  use('simrat39/rust-tools.nvim')

  -- TypeScript
  use {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup {}
    end,
  }

  -- Tmux
  use({ 'christoomey/vim-tmux-navigator', lazy = false })

  -- ChatGPT
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "pass show chatgpt/nvim"
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
