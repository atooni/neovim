vim.api.nvim_create_user_command('FormatProject', function()
  local file_types = {
    'ts',
    'js',
    'tsx',
    'jsx',
    'lua',
    'rs',
  }

  local file_pattern = table.concat(
    vim.tbl_map(function(ext)
      return "-name '*." .. ext .. "'"
    end, file_types),
    ' -o '
  )

  local cmd =
    string.format('find . -type f \\( %s \\) -not -path "*/node_modules/*" -not -path "*/dist/*"', file_pattern)

  local files = vim.fn.systemlist(cmd)
  local count = 0

  for _, file in ipairs(files) do
    -- Format each file
    require('conform').format { file = file }
    count = count + 1
  end

  print(string.format('Formatted %d files', count))
end, {})
