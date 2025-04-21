require("config.lazy")

-- Set tab options to use spaces instead of tabs
vim.cmd([[set expandtab]])
vim.cmd([[set tabstop=2]])
vim.cmd([[set softtabstop=2]])
vim.cmd([[set shiftwidth=2]])

-- Enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable clipboard integration with the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Configure conceal level for Obsidian syntax highlighting
vim.opt.conceallevel = 2

-- Case-insensitive searching, but make it case-sensitive if uppercase letters are present
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Define the gen.nvim command mapping
vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')


-- Both of them do the same thing 
vim.keymap.set('n','<C-\\>','<cmd>vs<cr>',{noremap=true, silent=true,desc="Split vertically"})
vim.keymap.set('n','<leader>\\','<cmd>vs<cr>',{noremap=true, silent=true,desc="Split vertically"})
