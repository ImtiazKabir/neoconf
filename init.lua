require("core.options")
require("core.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({

	require("plugins.oil"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lspconfig"),
	require("plugins.autocompletion"),
	require("plugins.lsplines"), -- should be registered after lspconfig
	require("plugins.none-ls"), -- for auto formatting
	require("plugins.gitsigns"),
	require("plugins.indent-blankline"),
	require("plugins.flash"),
	require("plugins.mini-surround"),
	require("plugins.snacks"),
	require("plugins.misc"),

	require("plugins.colorschemes.ayu"),
	require("plugins.colorschemes.nordic"),
	require("plugins.colorschemes.kanagawa"),
	require("plugins.colorschemes.everforest"),
	require("plugins.colorschemes.catppuccin"),
	require("plugins.colorschemes.jellybeans"),
	require("plugins.colorschemes.mountain"),
	require("plugins.colorschemes.gruvbox-material"),
	require("plugins.colorschemes.sonokai"),
})

vim.g.sonokai_enable_italic = true
vim.g.sonokai_style = "espresso"
vim.g.sonokai_better_performance = 1

vim.cmd("colorscheme catppuccin-mocha")
