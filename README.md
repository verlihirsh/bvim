<!-- banner-title: 🏠 jelvim -->
<!-- banner-tagline: My neovim setup -->
<img src="banner.svg" >

# jelvim 🚀

<p align="center">
  <strong>A modern Neovim configuration focused on productivity and AI-powered development</strong><br>
  Streamlined setup with LSP, Git integration, and OpenCode AI assistance
</p>

<p align="center">
  <a href="#installation"><img src="https://img.shields.io/badge/Neovim-0.10+-green?logo=neovim" alt="Neovim Version"></a>
  <a href="#features"><img src="https://img.shields.io/badge/Plugin_Manager-Lazy.nvim-blue" alt="Plugin Manager"></a>
  <a href="#features"><img src="https://img.shields.io/badge/Theme-Catppuccin-pink" alt="Theme"></a>
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a> •
  <a href="#features">Features</a> •
  <a href="#configuration">Configuration</a> •
  <a href="#keybindings">Keybindings</a> •
  <a href="#development">Development</a>
</p>

---

## Why jelvim?

A **carefully curated Neovim configuration** designed for modern development workflows with AI assistance.

**jelvim** gives you:
- **🚀 Fast startup**: Lazy-loaded plugins for optimal performance
- **⚡ AI integration**: Native OpenCode support for AI-assisted coding
- **🎨 Beautiful UI**: Catppuccin theme with custom dashboard and status line
- **📊 Git workflow**: Comprehensive Git integration (Fugitive, Gitsigns, Diffview)
- **🔧 LSP ready**: Pre-configured language servers with semantic highlighting
- **⏱️ Productivity tools**: Built-in Pomodoro timer and session management
- **🌳 Smart navigation**: Neo-tree with custom marks source and Edgy window management

---

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Features](#features)
- [Configuration](#configuration)
- [Keybindings](#keybindings)
- [Project Structure](#project-structure)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## Installation

### Prerequisites

**Required:**
- Neovim 0.10+ (with Lua support)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)

**Recommended:**
- `ripgrep` (for faster grep operations)
- `fd` (for faster file finding)
- LSP servers for your languages (e.g., `ruby-lsp`, `ts_ls`)

### Install

1. **Backup existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone git@github.com:verlihirsh/jelvim.git ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

   Lazy.nvim will automatically install all plugins on first launch.

4. **Wait for installation** to complete and restart Neovim.

---

## Quick Start

### First Launch

On first launch, you'll see:
1. Lazy.nvim installing all plugins
2. Alpha dashboard with project info and quick actions
3. Press `n` for new file, `f` to find files, or `p` for projects

### Basic Workflow

```bash
# Open Neovim in a project directory
cd ~/your-project
nvim

# Common actions:
# Space + f + f    → Find files
# Space + p + g    → Grep text
# Space + e + e    → Toggle file explorer
# Space + a + a    → Ask AI about current context
```

### Essential Keybindings

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<Space>ff` | Find files |
| `<Space>pg` | Grep text |
| `<Space>ee` | Toggle Neo-tree |
| `<Space>aa` | Ask OpenCode AI |
| `<Space>gg` | Git status |

**Press `<Space>` to see all available commands via which-key!**

---

## Features

### 🚀 Core Features

- **Lazy.nvim**: Lightning-fast plugin management with lazy loading
- **Modular configuration**: Clean separation of concerns (plugins, keymaps, options)
- **LSP integration**: Full LSP support with diagnostics, formatting, and code actions
- **Treesitter**: Advanced syntax highlighting and code understanding
- **Auto-pairs**: Automatic bracket and quote pairing
- **Sleuth**: Automatic indentation detection
- **Russian layout support**: Seamless command mode with Russian keyboard layout

### 🎨 UI/UX Features

- **Catppuccin theme**: Beautiful Mocha variant with custom highlights
- **Alpha dashboard**: Custom dashboard with project info, git status, and weather
- **Lualine**: Feature-rich status line with LSP info, git branch, and timer
- **Bufferline**: Elegant buffer tabs with diagnostics and pinning support
- **Edgy**: Smart window management for side panels
- **Noice**: Modern UI for messages, cmdline, and popups
- **Indent-blankline**: Visual indentation guides with scope highlighting
- **Which-key**: Interactive keybinding hints

### 🤖 AI & Productivity Features

- **OpenCode integration**: Native AI-powered coding assistance with context awareness
- **Blink.cmp**: Fast completion with GitHub Copilot support
- **Pomo.nvim**: Built-in Pomodoro timer with custom sessions (1h/2h work blocks)
- **Persistence**: Automatic session management and restoration
- **Project.nvim**: Smart project detection and switching

### 🔧 Development Features

- **Neo-tree**: File explorer with filesystem, buffers, git status, symbols, and custom marks
- **Git integration**:
  - Fugitive: Full Git workflow in Neovim
  - Gitsigns: Inline git blame and hunk navigation
  - Diffview: Beautiful diff and merge conflict resolution
- **Conform.nvim**: Automatic code formatting (Rubocop for Ruby)
- **Comment.nvim**: Smart commenting with `<leader>/`
- **Nvim-surround**: Easily change/delete/add surrounding characters
- **Todo-comments**: Highlight and search TODO/FIXME/NOTE comments

### 📁 Custom Features

- **Neo-tree Marks source**: Custom Neo-tree source for navigating Vim marks
- **Smart clipboard**: Manual clipboard integration with `ytc` (yank to clipboard) and `pfc` (paste from clipboard)
- **Ruby debugging shortcuts**: Insert `binding.irb` with `<Space>cd`

---

## Configuration

### File Structure

```
~/.config/nvim/
├── init.lua                 # Entry point, loads plugins and modules
├── lazy-lock.json          # Plugin version lock file
├── lua/
│   ├── options.lua         # Vim options and settings
│   ├── keymaps.lua         # Keybindings and which-key config
│   ├── dashboard.lua       # Alpha dashboard configuration
│   ├── plugins/
│   │   ├── init.lua        # Main plugin definitions
│   │   ├── blink.lua       # Completion config (Blink.cmp + Copilot)
│   │   ├── catppuccin.lua  # Theme configuration
│   │   ├── lspconfig.lua   # LSP server configurations
│   │   ├── neotree.lua     # Neo-tree file explorer config
│   │   └── noice.lua       # UI notifications config
│   └── neo-tree/sources/marks/  # Custom Neo-tree marks source
└── docs/                    # Documentation
```

### Core Settings

**Editor behavior:**
- 2-space indentation (tabs converted to spaces)
- Line numbers (relative + absolute)
- No swap files (undo files enabled)
- Smart search (case-insensitive unless uppercase present)
- Split windows below/right by default

**Clipboard:**
- System clipboard integration **disabled** by default
- Use `ytc` (yank to clipboard) and `pfc` (paste from clipboard) for explicit system clipboard access

**Session management:**
- Sessions auto-saved to `~/.local/state/nvim/sessions/`
- Restore last session: `<Space>qs`

---

## Keybindings

### Leader Key: `<Space>`

### File Operations
| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Grep text in files |
| `<Space>fn` | New file |

### Buffer Management
| Key | Action |
|-----|--------|
| `<Space>bd` | Delete buffer |
| `<Space>bp` | Toggle pin buffer |
| `<Space>bf` | Find buffer |
| `<Space>bb` | Pick buffer interactively |
| `<Space>bco` | Close other buffers |
| `<Space>bcr` | Close buffers to the right |
| `<Space>bcl` | Close buffers to the left |

### Git Operations
| Key | Action |
|-----|--------|
| `<Space>gg` | Git status |
| `<Space>gf` | File history |
| `<Space>gbb` | List branches |
| `<Space>gbn` | New branch |
| `<Space>gll` | Blame line |
| `<Space>glf` | Blame file |
| `<Space>gch` | Commit history |
| `<Space>gcam` | Add all & commit |
| `<Space>gcama` | Add all & AI-generate commit message |
| `<Space>gss` | Stash changes |
| `<Space>gsp` | Pop stash |
| `<Space>gpp` | Push |
| `<Space>gpsup` | Push & set upstream |
| `<Space>gds` | Changed files (diff) |
| `<Space>gdv` | Open Diffview |
| `<Space>gdh` | File history in Diffview |
| `<Space>gdH` | Branch history in Diffview |
| `<Space>gdq` | Close Diffview |

### LSP (Language Server)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `gy` | Type definition |
| `gD` | Go to declaration |
| `gci` | Incoming calls |
| `gco` | Outgoing calls |
| `K` | Hover documentation |
| `<C-k>` (insert) | Signature help |
| `<Space>ca` | Code action |
| `<Space>cr` | Rename symbol |
| `<Space>cf` | Format buffer |
| `<Space>cl` | Run code lens |
| `<Space>cL` | Refresh code lens |
| `<Space>ch` | Toggle inlay hints |
| `<Space>co` | Organize imports (TS/JS) |
| `<Space>cd` | Insert `binding.irb` (Ruby) |
| `<Space>csd` | Document symbols |
| `<Space>csw` | Workspace symbols |

### Diagnostics
| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<Space>ld` | Line diagnostics |
| `<Space>lb` | Buffer diagnostics |
| `<Space>lw` | Workspace diagnostics |

### AI (OpenCode)
| Key | Action |
|-----|--------|
| `<Space>aa` | Ask AI about current context |
| `<Space>ae` | Select AI action |
| `<Space>at` | Toggle AI panel |
| `<Space>aou` | Scroll AI panel up |
| `<Space>aod` | Scroll AI panel down |

### Explorer (Neo-tree)
| Key | Action |
|-----|--------|
| `<Space>ee` | Toggle explorer |
| `<Space>ef` | Focus filesystem |
| `<Space>eb` | Focus buffers |
| `<Space>eg` | Focus git status |
| `<Space>es` | Focus document symbols |
| `<Space>em` | Focus marks |
| `<Space>el` | Toggle left panel |
| `<Space>er` | Toggle right panel |
| `<Space>en` | Cycle windows |
| `<Space>et` | Toggle terminal |

### Pickers (Snacks.nvim)
| Key | Action |
|-----|--------|
| `<Space>pf` | Files |
| `<Space>pr` | Recent files |
| `<Space>ps` | Smart find |
| `<Space>pb` | Buffers |
| `<Space>pp` | Projects |
| `<Space>pg` | Grep |
| `<Space>pw` | Grep word under cursor |
| `<Space>pl` | Buffer lines |
| `<Space>pvs` | Git status |
| `<Space>pvb` | Git branches |
| `<Space>pvl` | Git log |
| `<Space>pnc` | Commands |
| `<Space>pnk` | Keymaps |
| `<Space>phh` | Help tags |

### Timer (Pomodoro)
| Key | Action |
|-----|--------|
| `<Space>ts2` | Start 2-hour focus session |
| `<Space>ts1` | Start 1-hour focus session |
| `<Space>tsr` | Start rest session |
| `<Space>tts` | Stop timer |
| `<Space>ttp` | Pause timer |
| `<Space>ttr` | Resume timer |
| `<Space>ttc` | Custom timer duration |

### Session Management
| Key | Action |
|-----|--------|
| `<Space>qq` | Quit without saving |
| `<Space>qwq` | Save all and quit |

### Clipboard (Custom)
| Key | Action |
|-----|--------|
| `ytc` | Yank to system clipboard (normal/visual) |
| `pfc` | Paste from system clipboard (normal/visual) |

### Other
| Key | Action |
|-----|--------|
| `<Space>/` | Toggle comment line/selection |
| `<C-w>w` | Cycle windows |

---

## Project Structure

### Key Components

**Plugin Management:**
- `lua/plugins/init.lua`: Main plugin declarations with lazy loading configuration
- `lazy-lock.json`: Plugin version lock file (37 plugins)

**Core Modules:**
- `lua/options.lua`: Editor settings (indentation, search, display, Russian layout support)
- `lua/keymaps.lua`: All keybindings organized with which-key groups
- `lua/dashboard.lua`: Alpha dashboard with project info, git status, and quick actions

**Plugin Configurations:**
- `lua/plugins/lspconfig.lua`: LSP servers (Ruby, TypeScript, and more)
- `lua/plugins/blink.lua`: Completion engine with Copilot integration
- `lua/plugins/neotree.lua`: File explorer with custom window settings
- `lua/plugins/catppuccin.lua`: Theme customization
- `lua/plugins/noice.lua`: UI enhancements for messages and notifications

**Custom Extensions:**
- `lua/neo-tree/sources/marks/`: Custom Neo-tree source for navigating Vim marks

---

## Customization

### Adding New Plugins

Edit `lua/plugins/init.lua`:

```lua
return {
  -- ... existing plugins ...
  
  {
    "author/plugin-name",
    event = "VeryLazy",  -- or other lazy-loading triggers
    config = function()
      require("plugin-name").setup({
        -- your configuration
      })
    end,
  },
}
```

Then restart Neovim or run `:Lazy sync`.

### Changing Theme

Edit `lua/plugins/catppuccin.lua` or add a different theme plugin in `lua/plugins/init.lua`.

### Adding LSP Servers

Edit `lua/plugins/lspconfig.lua`:

```lua
-- Add your language server
require("lspconfig").your_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
```

### Modifying Keybindings

Edit `lua/keymaps.lua` and modify the `wk.add()` table structure.

### Changing Dashboard

Edit `lua/dashboard.lua` to customize:
- Header ASCII art
- Project information display
- Quick action buttons

---

## Troubleshooting

### Plugins Not Loading

```bash
# Remove plugin cache and reinstall
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
nvim
```

### LSP Not Working

1. Check if LSP server is installed:
   ```bash
   which ruby-lsp  # or your language server
   ```

2. Check LSP logs:
   ```vim
   :LspLog
   ```

3. Restart LSP:
   ```vim
   :LspRestart
   ```

### Copilot Not Working

Ensure you're authenticated with GitHub:
```bash
gh auth login
# or authenticate through VSCode/official Copilot extension first
```

### Icons Not Showing

Install a [Nerd Font](https://www.nerdfonts.com/) and configure your terminal to use it.

### Performance Issues

1. Check startup time:
   ```bash
   nvim --startuptime startup.log
   ```

2. Profile plugins:
   ```vim
   :Lazy profile
   ```

---

## Development

### Prerequisites for Development

- Neovim 0.10+
- Lua 5.1+ (bundled with Neovim)
- Git
- Language servers for testing (optional)

### Plugin Stack

**Core infrastructure:**
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [Plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua utilities

**UI/UX:**
- [Catppuccin](https://github.com/catppuccin/nvim) - Theme
- [Alpha-nvim](https://github.com/goolord/alpha-nvim) - Dashboard
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) - Status line
- [Bufferline](https://github.com/akinsho/bufferline.nvim) - Buffer tabs
- [Edgy](https://github.com/folke/edgy.nvim) - Window management
- [Noice](https://github.com/folke/noice.nvim) - Modern UI
- [Which-key](https://github.com/folke/which-key.nvim) - Keybinding hints
- [Indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Indentation guides
- [Nvim-notify](https://github.com/rcarriga/nvim-notify) - Notifications

**Editor enhancements:**
- [Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting
- [Blink.cmp](https://github.com/Saghen/blink.cmp) - Completion engine
- [Blink-copilot](https://github.com/giuxtaposition/blink-copilot) - Copilot integration
- [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [Conform.nvim](https://github.com/stevearc/conform.nvim) - Formatting
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Commenting
- [Nvim-surround](https://github.com/kylechui/nvim-surround) - Surround operations
- [Nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-pairing
- [Vim-sleuth](https://github.com/tpope/vim-sleuth) - Auto-detect indentation

**File navigation:**
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - File explorer
- [Snacks.nvim](https://github.com/folke/snacks.nvim) - Pickers and terminal
- [Project.nvim](https://github.com/ahmedkhalf/project.nvim) - Project management

**Git:**
- [Vim-fugitive](https://github.com/tpope/vim-fugitive) - Git commands
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git signs and blame
- [Diffview](https://github.com/sindrets/diffview.nvim) - Diff and merge tool

**Productivity:**
- [OpenCode.nvim](https://github.com/NickvanDyke/opencode.nvim) - AI assistance
- [Pomo.nvim](https://github.com/epwalsh/pomo.nvim) - Pomodoro timer
- [Persistence.nvim](https://github.com/folke/persistence.nvim) - Session management
- [Todo-comments](https://github.com/folke/todo-comments.nvim) - TODO highlighting
- [Neoscroll](https://github.com/karb94/neoscroll.nvim) - Smooth scrolling

### Testing Changes

1. Make changes to configuration files
2. Restart Neovim or reload config:
   ```vim
   :source $MYVIMRC
   ```
3. Sync plugins if needed:
   ```vim
   :Lazy sync
   ```

### Contributing Code Style

- Use 2-space indentation
- Follow existing patterns in the codebase
- Keep plugin configurations self-contained
- Use lazy loading where appropriate
- Test changes before committing

---

## Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes following the code style above
4. Test your changes thoroughly
5. Commit your changes (`git commit -m 'feat: add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Areas for Contribution

- Additional LSP server configurations
- Custom Neo-tree sources
- Theme customizations
- Keybinding improvements
- Documentation enhancements
- Bug fixes

---

## License

This project is available under the MIT License. Feel free to use, modify, and distribute.

---

## Acknowledgments

Built with love using these amazing projects:

- [Neovim](https://neovim.io/) - Hyperextensible Vim-based text editor
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager
- [Catppuccin](https://github.com/catppuccin/nvim) - Beautiful pastel theme
- [OpenCode](https://github.com/NickvanDyke/opencode.nvim) - AI-powered coding assistance

Special thanks to the Neovim community and all plugin authors.

---

<p align="center">
  <strong>Happy coding! 🚀</strong>
</p>
