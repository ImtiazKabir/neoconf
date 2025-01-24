return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		char = "|",
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = true,
		use_treesitter = true,
		context_patterns = { "class", "function", "method" },
		filetype_exclude = { "help", "packer", "nvimtree", "dashboard", "neo-tree" },
		buftype_exclude = { "terminal", "nofile", "quickfix" },
	},
	config = function()
		-- local highlight = {
		-- 	"CursorColumn",
		-- 	"Whitespace",
		-- }
		-- require("ibl").setup({
		-- 	indent = { highlight = highlight, char = "" },
		-- 	whitespace = {
		-- 		highlight = highlight,
		-- 		remove_blankline_trail = false,
		-- 	},
		-- 	scope = { enabled = true },
		-- })
	end,
}
