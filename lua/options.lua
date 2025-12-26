-- Use line relative line numbers
vim.opt.nu = true
vim.opt.rnu = false

-- ensure new windows are opened to the left
-- or below respectively
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Use spaces instead of tabs and a tabwidth of 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
-- Use the tabstop value for indent and dedent
vim.opt.shiftwidth = 0

-- Indentation: use block-level indent (multiple of shiftwidth) instead of aligning with parenthesis
vim.opt.cindent = true
vim.opt.cinoptions = '(s,m1' -- Use shiftwidth for parens, don't align

-- Synchronizes the NeoVim Clipboard with the System ClipBoard
vim.opt.clipboard = 'unnamedplus'

-- vim.opt.scrolloff = 999

-- Ensure we can include cells without characters in visual
-- block editing
vim.opt.virtualedit = 'block'

-- Preview the effect of a substitution in a separate window
vim.opt.inccommand = 'split'

-- ignore case for command completion
vim.opt.ignorecase = true

-- better colors as we are in fact on a ui
vim.opt.termguicolors = true

-- Folding configuration (foldmethod set in treesitter config)
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 10

-- LSP performance - update diagnostics less frequently
vim.opt.updatetime = 500 -- Wait 500ms instead of default 250ms
-- Note: diagnostic config is in plugins/lsp.lua
