return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
				-- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "modus-vivendi",
				-- Some useful glyphs:
				-- https://www.nerdfonts.com/cheat-sheet
				--        

				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },

				-- component_separators = { left = '', right = ''},
				-- section_separators = { left = '', right = ''},

				-- component_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = '' },

				disabled_filetypes = { "alpha", "neo-tree" },
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", diff, diagnostics },
				lualine_c = { filename },
				lualine_w = { "searchcount", "selectioncount" },
				lualine_x = {
					{ "encoding", cond = hide_in_width },
					{ "fileformat", cond = hide_in_width },
					{ "filesize", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_w = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "fugitive" },
		})
	end,
}
