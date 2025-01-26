-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- mode switching
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

-- split
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to down split" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to up split" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right split" })
map("", "<C-Up>", "<cmd>resize +3<cr>", { silent = true, desc = "Horizontal split grow by 3" })
map("", "<C-Down>", "<cmd>resize -3<cr>", { silent = true, desc = "Horizontal split shrink by 3" })
map("", "<C-Left>", "<cmd>vertical resize +3<cr>", { silent = true, desc = "Veritcal split grow by 3" })
map("", "<C-Right>", "<cmd>vertical resize -3<cr>", { silent = true, desc = "Vertical split shrink by 3" })

-- Window management
vim.keymap.set("n", "<leader>V", "<C-w>v", { noremap = true, silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>H", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" })
vim.keymap.set(
	"n",
	"<leader>se",
	"<C-w>=",
	{ noremap = true, silent = true, desc = "Make split windows equal width & height" }
)
vim.keymap.set("n", "<leader>xs", ":close<CR>", { noremap = true, silent = true, desc = "Close current split window" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true, desc = "Navigate to up split window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true, desc = "Navigate to down split window" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true, desc = "Navigate to left split window" })
vim.keymap.set(
	"n",
	"<C-l>",
	":wincmd l<CR>",
	{ noremap = true, silent = true, desc = "Navigate to right split window" }
)

-- Buffers
vim.keymap.set("n", "<leader>bo", "<cmd> enew <CR>", { noremap = true, silent = true, desc = "Open new buffer" })
vim.keymap.set("n", "<leader>bx", ":bdelete!<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Go to previous buffer" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { noremap = true, silent = true, desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { noremap = true, silent = true, desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true, silent = true, desc = "Go to previous tab" })

vim.keymap.set(
	"n",
	"<leader>lw",
	"<cmd>set wrap!<CR>",
	{ noremap = true, silent = true, desc = "Toggle line wrapping" }
)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right" })

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true, desc = "Paste yanked text" })
-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete a character" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
