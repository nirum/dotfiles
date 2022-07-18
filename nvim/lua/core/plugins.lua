-- plugins.lua
-- Author: Niru Maheswaranathan
-- Website: https://github.com/nirum/dotfiles

-- Use a protected call in case packer is not installed.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup({
	function(use)
		use("lewis6991/impatient.nvim") -- speeds up neovim startup time.

		use("wbthomason/packer.nvim") -- Have packer manage itself.
		use("nvim-lua/popup.nvim") -- An implementation of the Popup API in neovim.
		use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins.

		use({
			"nvim-treesitter/nvim-treesitter", -- treesitter support
			run = ":TSUpdate",
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup()
			end,
		})

		use({
			"norcalli/nvim-colorizer.lua", -- color hex codes
			config = function()
				require("colorizer").setup()
			end,
		})

		use("mfussenegger/nvim-dap") -- DAP
		use("mfussenegger/nvim-dap-python") -- pip install debugpy
		use({ "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } })

		use("hrsh7th/nvim-cmp") -- Completion Engine
		use("hrsh7th/cmp-path") -- [cmp] path source
		use("hrsh7th/cmp-buffer") -- [cmp] buffer source
		use("hrsh7th/cmp-cmdline") -- [cmp] cmdline source?
		use("saadparwaiz1/cmp_luasnip") -- snippet completions

		use("hrsh7th/cmp-nvim-lsp") -- [cmp] LSP source
		use("hrsh7th/cmp-nvim-lua") -- [cmp] neovim-lua completions
		use("onsails/lspkind-nvim") -- adds symbols to LSP completion

		use("L3MON4D3/LuaSnip") -- snippets engine
		use("rafamadriz/friendly-snippets") -- preset snippets

		use("neovim/nvim-lspconfig") -- LSP
		use("williamboman/nvim-lsp-installer") -- simple to use language server installer

		use("nvim-telescope/telescope.nvim") -- Fuzzy Finding
		use("nvim-telescope/telescope-dap.nvim")
		use("sbdchd/neoformat") -- yapf formatting
		--
		use("folke/tokyonight.nvim") -- colorscheme

		use({
			"numToStr/Comment.nvim", -- commenting plugin
			config = function()
				require("Comment").setup()
			end,
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})

		use({
			"lewis6991/gitsigns.nvim", -- git signs
			config = function()
				require("gitsigns").setup()
			end,
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = {},
			config = function()
				require("null-ls").setup({
					sources = {
						require("null-ls").builtins.formatting.prettier,
						require("null-ls").builtins.formatting.black,
						require("null-ls").builtins.formatting.stylua,
						require("null-ls").builtins.diagnostics.mypy,
					},
				})
			end,
		})

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({
			"kdheepak/tabline.nvim",
			requires = { { "nvim-lualine/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
		})

		use({
			"akinsho/toggleterm.nvim",
			tag = "v1.*",
			config = function()
				require("toggleterm").setup({
					size = 20,
					open_mapping = [[<c-t>]],
					hide_numbers = true,
					shade_terminals = true,
					shading_factor = 1,
					start_in_insert = true,
					insert_mappings = true,
					persist_size = true,
					direction = "float",
					float_opts = {
						border = "curved",
						winblend = 0,
						highlights = {
							border = "Normal",
							background = "Normal",
						},
					},
				})
			end,
		})
	end,
})
