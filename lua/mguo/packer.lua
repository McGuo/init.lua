--" This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end })

	  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	  use('nvim-treesitter/playground')
	  use('theprimeagen/harpoon')
	  use('mbbill/undotree')
      use('tpope/vim-fugitive')
	  use {
		  'VonHeikemen/lsp-zero.nvim',
		  branch = 'v3.x',
		  requires = {
			  --- Uncomment these if you want to manage LSP servers from neovim
			  -- {'williamboman/mason.nvim'},
			  -- {'williamboman/mason-lspconfig.nvim'},

			  -- LSP Support
			  {'neovim/nvim-lspconfig'},
			  -- Autocompletion
			  {'hrsh7th/nvim-cmp'},
			  {'hrsh7th/cmp-nvim-lsp'},
			  {'L3MON4D3/LuaSnip'},
		  }
	  }
      use {
          "nvim-telescope/telescope-file-browser.nvim",
          requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
      }

      use ('Mofiqul/dracula.nvim')
      use('christoomey/vim-tmux-navigator')
      use('nvim-tree/nvim-web-devicons')
      use("lewis6991/gitsigns.nvim")
      use("tpope/vim-dadbod")
      use {
          'nvim-lualine/lualine.nvim',
          requires = { 'nvim-tree/nvim-web-devicons', opt = true }
      }

      use {
          'numToStr/Comment.nvim',
          config = function()
              require('Comment').setup(
              {
                  ignore = '^$'
              }

              )
          end
      }

      use {'PedramNavid/dbtpal',

      config = function()
          local dbt = require('dbtpal')
          dbt.setup {
              -- Path to the dbt executable
              path_to_dbt = "dbt",

              -- Path to the dbt project, if blank, will auto-detect
              -- using currently open buffer for all sql,yml, and md files
              path_to_dbt_project = "",

              -- Path to dbt profiles directory
              path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",

              -- Search for ref/source files in macros and models folders
              extended_path_search = true,

              -- Prevent modifying sql files in target/(compiled|run) folders
              protect_compiled_files = true

          }

          -- Setup key mappings

          vim.keymap.set('n', '<leader>drf', dbt.run)
          vim.keymap.set('n', '<leader>dtf', dbt.test)
          -- vim.keymap.set('n', '<leader>dm', require('dbtpal.telescope').dbt_picker)

          -- Enable Telescope Extension
          require'telescope'.load_extension('dbtpal')
      end,
      requires = { { 'nvim-lua/plenary.nvim' }, {'nvim-telescope/telescope.nvim'} }
  }
  
  end )
