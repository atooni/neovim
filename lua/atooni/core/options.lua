vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.cursorline = true                       -- Highlight the line the cursor is in 

-- tab & indentation
opt.tabstop = 2                             -- 2 spaces for tabs 
opt.shiftwidth = 2                          -- 2 spaces for indent width 
opt.expandtab = true                        -- expand tabs to spaces 
opt.autoindent = true                       -- copy indent from current line when starting a new one 

-- search settings 
opt.ignorecase = true                       -- ignore case when searching 
opt.smartcase = true                        -- if the search includes mixed case chars, assume the search is case sensitive

-- color scheme settings
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace 
opt.backspace = "indent,eol,start"          -- allow backspace on indent, end of line or insert start position

-- clipboard
-- opt.clipboard:append("unnamedplus")      -- Use system clipboard as default register
--
-- split windows

opt.splitright = true
opt.splitbelow = true

