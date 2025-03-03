local map = vim.keymap.set

return (
{
  "ibhagwan/fzf-lua",
  config = function()
    local plugin = require("fzf-lua")
    plugin.setup()

    map("n", "<leader>ff", ":FzfLua files<CR>", {desc = "Open fzf for files by name" })
    map("n", "<leader>fg", ":FzfLua grep<CR>", {desc = "Open fzf for grep" })
    map("n", "<leader>fb", ":FzfLua buffers<CR>", {desc = "Open fzf for the currently open buffers" })
    map("n", "<leader>fw", ":FzfLua lsp_workspace_symbols<CR>", {desc = "Open fzf for symbols in the workspace"})
    map("n", "<leader>fd", ":FzfLua lsp_document_symbols<CR>", {desc = "Open fzf for symbols in the dowcument"})

  end
}
)
