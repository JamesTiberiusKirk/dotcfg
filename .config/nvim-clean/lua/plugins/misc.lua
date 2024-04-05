return {
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		-- event = "LazyFile",
		config = true,
		-- stylua: ignore
		keys = {
			{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
			{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = opts.sources or {}
			table.insert(opts.sources, nls.builtins.formatting.prettier)
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree reveal<CR>", desc = "Explorer NeoTree (root dir)", remap = true },
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {

      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
		config = function(_, opts)
			local function on_move(data)
				Util.lsp.on_rename(data.source, data.destination)
			end

			local events = require("neo-tree.events")
			opts.event_handlers = opts.event_handlers or {}
			vim.list_extend(opts.event_handlers, {
				{ event = events.FILE_MOVED, handler = on_move },
				{ event = events.FILE_RENAMED, handler = on_move },
			})
			require("neo-tree").setup(opts)
			vim.api.nvim_create_autocmd("TermClose", {
				pattern = "*lazygit",
				callback = function()
					if package.loaded["neo-tree.sources.git_status"] then
						require("neo-tree.sources.git_status").refresh()
					end
				end,
			})
		end,
	},
	{ 'numToStr/Navigator.nvim', config = function() require('Navigator').setup() end,
		lazy = false,
		keys = {
			{"<C-h>","<CMD>NavigatorLeft<CR>", desc = "Navidate left"},
			{"<C-j>","<CMD>NavigatorDown<CR>", desc = "Navidate down"},
			{"<C-k>","<CMD>NavigatorUp<CR>", desc = "Navidate up"},
			{"<C-l>","<CMD>NavigatorRight<CR>", desc = "Navidate right"},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		-- event = "LazyFile",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				-- stylua: ignore start
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>ghd", gs.diffthis, "Diff This")
				map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},
--	{
--		"folke/which-key.nvim",
--		event = "VeryLazy",
--		opts = {
--			plugins = { spelling = true },
--			defaults = {
--				mode = { "n", "v" },
--				["g"] = { name = "+goto" },
--				["gs"] = { name = "+surround" },
--				["]"] = { name = "+next" },
--				["["] = { name = "+prev" },
--				["<leader><tab>"] = { name = "+tabs" },
--				["<leader>b"] = { name = "+buffer" },
--				["<leader>c"] = { name = "+code" },
--				["<leader>f"] = { name = "+file/find" },
--				["<leader>g"] = { name = "+git" },
--				["<leader>gh"] = { name = "+hunks" },
--				["<leader>q"] = { name = "+quit/session" },
--				["<leader>s"] = { name = "+search" },
--				["<leader>u"] = { name = "+ui" },
--				["<leader>w"] = { name = "+windows" },
--				["<leader>x"] = { name = "+diagnostics/quickfix" },
--			},
--		},
--		config = function(_, opts)
--			local wk = require("which-key")
--			wk.setup(opts)
--			wk.register(opts.defaults)
--		end,
--	},
--	{
--		'numToStr/Navigator.nvim',
--		config = function()
--			require('Navigator').setup()
--		end,
--		lazy = false,
--		keys = {
--			{"<C-h>","<CMD>NavigatorLeft<CR>", desc = "Navidate left"},
--			{"<C-j>","<CMD>NavigatorDown<CR>", desc = "Navidate down"},
--			{"<C-k>","<CMD>NavigatorUp<CR>", desc = "Navidate up"},
--			{"<C-l>","<CMD>NavigatorRight<CR>", desc = "Navidate right"},
--		},
--	}
}

