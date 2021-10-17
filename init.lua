-- install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- plugins
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Theme inspired by Atom
  use 'joshdick/onedark.vim' 
  -- Mine
  use "Pocco81/Catppuccino.nvim"                       
  -- Fancier statusline
  use 'itchyny/lightline.vim' 
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects' 
  -- Collection of configurations for built-in LSP client                           
  use 'neovim/nvim-lspconfig' 
  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp' 
  -- nvim-cmp source for neovim builtin LSP client
  use 'hrsh7th/cmp-nvim-lsp' 
  -- luasnip completion source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' 
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'
        
  -- nvim-tree            
  use { 
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
                         
  -- nice diagnostic pane on the bottom
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
            auto_open = true, -- automatically open the list when you have diagnostics
            auto_close = true, -- automatically close the list when you have no diagnostics
        }
    end
  }     
    
  -- persist and toggle multiple terminals during an editing session
  use {"akinsho/toggleterm.nvim"}
end)

-- nvim options
require('misc')

-- keybindings
require('keybindings/keybindings')

-- individual plugin configurations
require('plugin_configs/toggle_term')
require('plugin_configs/nvim_tree')
require('plugin_configs/nvim_cmp')
require('plugin_configs/lsp')
require('plugin_configs/treesitter')
require('plugin_configs/telescope')
require('plugin_configs/git_signs')
require('plugin_configs/lightline')

-- theming options
require('theming/colorscheme')
require('theming/font')
