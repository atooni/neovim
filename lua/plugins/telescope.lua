local map = vim.keymap.set

return (
{
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = function(_, path)
          -- Get the current project root (using git or cwd)
          local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
          if vim.v.shell_error ~= 0 then
            -- Fallback to current working directory if not in git repo
            root = vim.fn.getcwd()
          end

          -- Make sure the root has trailing slash
          if root:sub(-1) ~= "/" then root = root .. "/" end

          -- Only show path relative to project root
          local rel_path = path
          if path:find(root, 1, true) == 1 then
            rel_path = path:sub(#root + 1)
          end

          -- Get the filename
          local filename = rel_path:match("([^/]+)$") or rel_path

          -- Get shortened directory structure (first letter of each dir)
          local dirs = {}
          for dir in string.gmatch(rel_path, "([^/]+)/") do
            table.insert(dirs, string.sub(dir, 1, 1))
          end

          -- Create the shortened path
          local shortened = table.concat(dirs, "/") .. (next(dirs) ~= nil and "/" or "") .. filename

          return shortened
        end
      }
    })
    -- Set up keymapping for diagnostics
    map('n', '<leader>dd', ":Telescope diagnostics<CR>", { desc = "Show diagnostics in Telescope" })
    map('n', '<leader>dr', ":Telescope lsp_references<CR>", { desc = "Show references in Telescope" })
  end
}
)
