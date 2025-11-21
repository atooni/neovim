# Neovim Configuration

A modern Neovim configuration optimized for TypeScript and Lua development with LSP support, auto-formatting, fuzzy finding, and Git integration.

## Overview

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager and provides a complete development environment with IDE-like features while maintaining Neovim's efficiency.

### Key Features

- **LSP Integration**: Full Language Server Protocol support with auto-completion and diagnostics
- **Auto-formatting**: Format on save for TypeScript, JavaScript, and Lua files
- **Fuzzy Finding**: Fast file and text searching with FZF
- **Git Integration**: Built-in Git UI, diff viewing, and hunk management
- **Syntax Highlighting**: TreeSitter-based syntax highlighting
- **File Explorer**: Tree-style file navigation
- **Multiple Themes**: Choose from Kanagawa, The Matrix, or Material themes

## Installation

1. Ensure you have Neovim 0.9+ installed
2. Clone this repository to your Neovim config directory:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```
3. Open Neovim and the plugins will automatically install:
   ```bash
   nvim
   ```
4. Restart Neovim after initial installation

## Language Support

### Supported Languages

- **TypeScript/JavaScript**: Full LSP support with ts_ls and ESLint
- **Lua**: Optimized for Neovim configuration development
- **Rust**: Full LSP support with rust_analyzer and rustfmt
- **C/C++**: LSP support via clangd

### Formatters

- **Prettier**: TypeScript, JavaScript, TSX, JSX
- **Stylua**: Lua formatting with custom configuration
- **Rustfmt**: Rust formatting with auto-format on save
- **ESLint**: Auto-fix on save for TypeScript/JavaScript files

### LSP Features

- Go to definition
- Symbol renaming
- Hover documentation (press `K` twice to enter the window and navigate)
- Workspace and document symbols
- Diagnostics with filtered warnings (unused variables hidden for TS)
- Auto-completion with snippets

## Key Bindings

Leader key: `,` (comma)

**Tip**: Press the leader key and wait 500ms to see all available keybindings in a popup (powered by which-key.nvim)

### File Navigation

| Key | Action |
|-----|--------|
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `<leader>e` | Open file explorer |
| `<leader>ec` | Close file explorer |

### Fuzzy Finding (FZF)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files by name |
| `<leader>fg` | Live grep search |
| `<leader>fb` | Find open buffers |
| `<leader>fw` | Find workspace symbols |
| `<leader>fd` | Find document symbols |
| `<leader>fs` | Git status files |

### LSP

| Key | Action |
|-----|--------|
| `<leader>ld` | Go to definition |
| `<leader>lr` | Rename symbol |
| `<leader>lh` or `K` | Show hover documentation |
| `<leader>dd` | Document diagnostics |
| `<leader>dw` | Workspace diagnostics |
| `<leader>dr` | Find references |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `<leader>hn` | Next hunk |
| `<leader>hp` | Previous hunk |
| `<leader>hv` | Preview hunk (show diff) |
| `<leader>hs` | Stage hunk |
| `<leader>hu` | Unstage hunk |

**Git Features:**
- Inline diff: Deleted lines shown as virtual text
- Git blame: Shows author and commit info after 500ms delay on current line
- Gutter signs: Visual indicators for added/modified/deleted lines

### Rust

| Key | Action |
|-----|--------|
| `<leader>rd` | Open external docs (docs.rs) |
| `<leader>rc` | Open Cargo.toml |
| `<leader>rr` | Show runnables (run tests, examples) |
| `<leader>re` | Expand macro under cursor |
| `<leader>rm` | Rebuild procedural macros |
| `<leader>rp` | Go to parent module |
| `<leader>rj` | Join lines (Rust-aware) |

**Rust Features:**
- External documentation: Jump directly to docs.rs for any symbol
- Macro expansion: See what macros expand to
- Clippy integration: Get clippy suggestions as diagnostics
- Inlay hints: See types inline without hovering

### Formatting

| Key | Action |
|-----|--------|
| `<leader>cp` | Format all project files |
| Auto-format on save for .ts, .js, .tsx, .jsx, .lua, .rs files |

### Completion

| Key | Action |
|-----|--------|
| `Up` | Select previous completion |
| `Down` | Select next completion |
| `Ctrl+Enter` | Accept completion |

## Installed Plugins

### Core Plugins

- **lazy.nvim**: Plugin manager
- **nvim-lspconfig**: LSP configuration
- **mason.nvim**: LSP/formatter installer
- **mason-lspconfig**: Bridge between Mason and LSP
- **mason-tool-installer**: Auto-install formatters

### Development Tools

- **blink.cmp**: Fast completion engine with snippets
- **conform.nvim**: Code formatting
- **nvim-treesitter**: Syntax highlighting and parsing
- **rustaceanvim**: Enhanced Rust development tools

### File Management

- **fzf-lua**: Fuzzy finder
- **nvim-tree**: File explorer
- **nvim-web-devicons**: File icons

### Git Integration

- **lazygit.nvim**: Terminal UI for Git
- **gitsigns.nvim**: Git decorations, inline diff view, and hunk management with git blame
- **diffview.nvim**: Git diff viewer

### UI

- **lualine.nvim**: Statusline
- **which-key.nvim**: Keybinding help popup
- **kanagawa.nvim**: Theme (default)
- **the-matrix.nvim**: Alternative theme
- **material.nvim**: Alternative theme

## Configuration Structure

```
.
├── init.lua                    # Entry point
├── lua/
│   ├── settings.lua           # Loads options, keymaps, commands
│   ├── options.lua            # Editor options (line numbers, tabs, etc.)
│   ├── keymaps.lua            # Basic key mappings
│   ├── commands.lua           # Custom commands (FormatProject)
│   ├── plugins.lua            # Plugin manager setup
│   └── plugins/
│       ├── completion.lua     # Completion configuration
│       ├── diffview.lua       # Diff viewer
│       ├── fzf-lua.lua       # Fuzzy finder
│       ├── gitsigns.lua      # Git signs
│       ├── lazygit.lua       # LazyGit integration
│       ├── lsp.lua           # LSP configuration
│       ├── lualine.lua       # Statusline
│       ├── rustaceanvim.lua  # Rust development tools
│       ├── themes.lua        # Theme configuration
│       ├── tree.lua          # File explorer
│       └── which-key.lua     # Keybinding help
├── lazy-lock.json             # Plugin version lock
└── stylua.toml               # Stylua formatter config
```

## Editor Options

- **Line numbers**: Relative line numbers enabled
- **Indentation**: 2 spaces, expand tabs
- **Splits**: Open below and to the right
- **Search**: Case-insensitive
- **Visual block**: Virtual editing enabled
- **Substitution**: Live preview in split window

## Custom Commands

- `:FormatProject` - Format all TypeScript, JavaScript, Lua, and Rust files in the project (excluding node_modules and dist)

## Customization

### Changing the Theme

Edit `lua/plugins/themes.lua` and change the `theme` variable:
```lua
local theme = "kanagawa"  -- Options: "kanagawa", "the-matrix", "material"
```

### Adding New LSP Servers

Edit `lua/plugins/lsp.lua` and add to the `ensure_installed` table:
```lua
ensure_installed = { 'clangd', 'lua_ls', 'ts_ls', 'eslint', 'your_server' }
```

### Adding New Formatters

1. Add to `mason-tool-installer` in `lua/plugins/lsp.lua`
2. Configure in `conform.nvim` formatters_by_ft

## Troubleshooting

### LSP not working

1. Check if the language server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Restart LSP: `:LspRestart`

### Formatting not working

1. Verify formatter is installed: `:Mason`
2. Check conform status: `:ConformInfo`
3. Ensure the file type is configured in `lua/plugins/lsp.lua`

### Plugins not loading

1. Update plugins: `:Lazy update`
2. Clean and reinstall: `:Lazy clean` then `:Lazy install`
3. Check for errors: `:Lazy log`

## License

This configuration is provided as-is for personal use.
