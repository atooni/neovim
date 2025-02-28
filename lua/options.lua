-- Use line relative line numbers 
vim.opt.nu = true 
vim.opt.rnu = true

-- ensure new windows are opened to the left 
-- or below respectively 
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Use spaces instead of tabs and a tabwidth of 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
-- Use the tabstop value for indent and dedent 
vim.opt.shiftwidth = 0 

-- Synchronizes the NeoVim Clipboard with the System ClipBoard
vim.opt.clipboard = "unnamedplus"

-- vim.opt.scrolloff = 999

-- Ensure we can include cells without characters in visual 
-- block editing 
vim.opt.virtualedit = "block"

-- Preview the effect of a substitution in a separate window
vim.opt.inccommand = "split"

-- ignore case for command completion 
vim.opt.ignorecase = true

-- better colors as we are in fact on a ui 
vim.opt.termguicolors = true
