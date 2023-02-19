-- Installed path at ~/.local/share/nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

return packer.startup(function (use)
  -- essential
  use ('wbthomason/packer.nvim')
  use ('nvim-lua/plenary.nvim')

  -- colorscheme
  use ('ellisonleao/gruvbox.nvim')

  -- accessible
  use ('tpope/vim-surround')
  use ('vim-scripts/ReplaceWithRegister')
  use ('numToStr/Comment.nvim')
  use ('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
  use ('nvim-lualine/lualine.nvim')

  -- autocompletion
  use ({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- lua snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  })

  -- nvim-tree
  use ({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
    tag = 'nightly'
  })

  -- fuzzy finding !!TELESCOPE!!
  use ({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }) -- improve performance
  use ({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' }) 

  -- LSP/DAP servers manager !!MASON!!
  use ({
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  })

end)
