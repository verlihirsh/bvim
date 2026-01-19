return {
  require("plugins.neotree"),
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
      options = {
        left = { size = 35 },
        right = { size = 60 },
      },
      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          -- open = "Neotree position=left filesystem",
        },
      },
      right = {
        {
          title = "OpenCode",
          ft = "opencode_terminal",
          -- size = { height = 0.7 },
          -- pinned = true,
          open = function()
            require("opencode").toggle()
          end,
        },
      },
      bottom = {
        {
          ft = "snacks_terminal",
          size = { height = 0.3 },
          -- pinned = true,
          -- open = function()
          --   Snacks.terminal()
          -- end,
          title = "snacks_terminal",
        },
      },
      animate = { enabled = false },
      wo = {
        winbar = true,
        winfixwidth = true,
        winfixheight = true,
        winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
        spell = false,
        signcolumn = "no",
      },
      keys = {
        ["q"] = function(win) win:hide() end,
        ["<C-q>"] = function(win) win.view.edgebar:close() end,
      },
    },
  },
  require("plugins.blink"),

  require("plugins.catppuccin"),
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  -- {
  --   'hands-free-vim/cursorless.nvim',
  --   dependencies = { 'hands-free-vim/talon.nvim' },
  --   config = function()
  --     require("talon").setup()
  --     require("cursorless").setup({
  --       shortcut = "<C-S-f12>",
  --     })
  --     vim.keymap.set("n", "<leader>vt", function()
  --       vim.fn.system("open -g 'talon://toggle'")
  --     end, { desc = "Toggle Talon listening" })
  --
  --     local cheatsheet_buf = nil
  --     local cheatsheet_win = nil
  --     local cheatsheet_content = {
  --       "╔══════════════════════════════╗",
  --       "║     TALON VOICE CHEATSHEET   ║",
  --       "╠══════════════════════════════╣",
  --       "║ NATO ALPHABET                ║",
  --       "╠══════════════════════════════╣",
  --       "║ alpha    A │ november  N    ║",
  --       "║ bravo    B │ oscar     O    ║",
  --       "║ charlie  C │ papa      P    ║",
  --       "║ delta    D │ quebec    Q    ║",
  --       "║ echo     E │ romeo     R    ║",
  --       "║ foxtrot  F │ sierra    S    ║",
  --       "║ golf     G │ tango     T    ║",
  --       "║ hotel    H │ uniform   U    ║",
  --       "║ india    I │ victor    V    ║",
  --       "║ juliet   J │ whiskey   W    ║",
  --       "║ kilo     K │ xray      X    ║",
  --       "║ lima     L │ yankee    Y    ║",
  --       "║ mike     M │ zulu      Z    ║",
  --       "╠══════════════════════════════╣",
  --       "║ NUMBERS                      ║",
  --       "╠══════════════════════════════╣",
  --       "║ zero one two three four      ║",
  --       "║ five six seven eight nine    ║",
  --       "╠══════════════════════════════╣",
  --       "║ MODIFIERS                    ║",
  --       "╠══════════════════════════════╣",
  --       "║ control option shift command ║",
  --       "╠══════════════════════════════╣",
  --       "║ SPECIAL KEYS                 ║",
  --       "╠══════════════════════════════╣",
  --       "║ escape  enter  tab  space    ║",
  --       "║ backspace  delete            ║",
  --       "║ up  down  left  right        ║",
  --       "║ home  end  page up/down      ║",
  --       "╠══════════════════════════════╣",
  --       "║ DICTATION                    ║",
  --       "╠══════════════════════════════╣",
  --       "║ say <text>     → type text   ║",
  --       "║ sentence <t>   → Title case  ║",
  --       "║ snake <text>   → snake_case  ║",
  --       "║ camel <text>   → camelCase   ║",
  --       "╠══════════════════════════════╣",
  --       "║ VIM EXAMPLES                 ║",
  --       "╠══════════════════════════════╣",
  --       "║ five juliet    → 5j          ║",
  --       "║ delete whiskey → dw          ║",
  --       "║ control romeo  → Ctrl+R      ║",
  --       "╚══════════════════════════════╝",
  --     }
  --
  --     vim.keymap.set("n", "<leader>vc", function()
  --       if cheatsheet_win and vim.api.nvim_win_is_valid(cheatsheet_win) then
  --         vim.api.nvim_win_close(cheatsheet_win, true)
  --         cheatsheet_win = nil
  --         return
  --       end
  --
  --       cheatsheet_buf = vim.api.nvim_create_buf(false, true)
  --       vim.api.nvim_buf_set_lines(cheatsheet_buf, 0, -1, false, cheatsheet_content)
  --       vim.api.nvim_buf_set_option(cheatsheet_buf, "modifiable", false)
  --       vim.api.nvim_buf_set_option(cheatsheet_buf, "buftype", "nofile")
  --       vim.api.nvim_buf_set_option(cheatsheet_buf, "filetype", "talon_cheatsheet")
  --
  --       vim.cmd("topleft 34vsplit")
  --       cheatsheet_win = vim.api.nvim_get_current_win()
  --       vim.api.nvim_win_set_buf(cheatsheet_win, cheatsheet_buf)
  --       vim.api.nvim_win_set_option(cheatsheet_win, "number", false)
  --       vim.api.nvim_win_set_option(cheatsheet_win, "relativenumber", false)
  --       vim.api.nvim_win_set_option(cheatsheet_win, "winfixwidth", true)
  --
  --       vim.api.nvim_buf_set_keymap(cheatsheet_buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  --       vim.cmd("wincmd p")
  --     end, { desc = "Toggle Talon cheatsheet" })
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query" },
      })
    end,
  },

  {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {
      notifiers = {
        {name = "System"}
      },
      sessions = {
          default1h = {
            { name = "Work", duration = "20m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "20m" },
          },
          default2h = {
            { name = "Work", duration = "20m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "20m" },
            { name = "Long Break", duration = "15m" },
            { name = "Work", duration = "20m" },
            { name = "Short Break", duration = "5m" },
            { name = "Work", duration = "20m" },
          },
          rest = {
            { name = "Long Break", duration = "30m" },
          }
        },
    },
  },

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "Gemfile", "src/Gemfile" },
        show_hidden = true,
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          ruby = { "rubocop" },
        },
        formatters = {
          rubocop = {
            command = "bundle",
            args = { "exec", "rubocop", "--autocorrect", "--stdin", "$FILENAME", "--stderr" },
            stdin = true,
            require_cwd = true,
          }
        },
      })
    end,
  },


  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_horizontal" },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 35 },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin-mocha",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "dashboard", "AvanteInput", "Avante", "AvanteSelectedFiles", "neo-tree", "opencode_terminal" },
        },
        winbar = {
          lualine_c = {
            function()
              return require("nvim-navic").get_location()
            end,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
              "filename"
          },
          lualine_x = { require("opencode").statusline, "encoding", "fileformat", "filetype" },
          lualine_y = { "location" },
          lualine_z = { "progress",
            function()
              local ok, pomo = pcall(require, "pomo")
              if not ok then
                return ""
              end

              local timer = pomo.get_first_to_finish()
              if timer == nil then
                return ""
              end

              return "󰄉 " .. tostring(timer)
            end,
          }
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "neo-tree",
              highlight = "Directory",
              separator = true,
            },
            {
              filetype = "opencode_terminal",
              separator = true,
            }
          },
          groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "󰐃 " })
            }
          },
        },
        highlights = {
          buffer_selected = {
            bold = true,
            italic = false,
          },
        },
      })
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    lazy = false,
    config = function()
      require('Comment').setup({
        toggler = { line = '<leader>/' },
        opleader = {
            line = '<leader>/',
        },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({
        scope = {
           enabled = true,
           show_start = false,
           show_end = false,
           injected_languages = true,
           highlight = { "Function", "Label" },
           priority = 500,
         }
      })
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
  },


  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "slide",
        timeout = 3000,
        render = "wrapped-compact",
        background_colour = "#000000",
        max_width = 50,
        max_height = 3,
        on_open = function(win)
          vim.api.nvim_win_set_config(win, {
            focusable = false,
          })
        end,
      })
      vim.notify = notify
    end,
  },
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  require("plugins.noice"),
  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
  },
  
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" },
        pre_save = function()
          local excluded_filetypes = {
            "neo-tree",
            "snacks_terminal",
            "opencode_terminal",
            "notify",
            "noice",
            "edgy",
          }
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local ft = vim.bo[buf].filetype
            for _, excluded_ft in ipairs(excluded_filetypes) do
              if ft == excluded_ft then
                vim.api.nvim_buf_delete(buf, { force = true })
                break
              end
            end
          end
        end,
        save_empty = false,
      })
    end,
  },


  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      input = { enabled = true },
      terminal = { enabled = true },
      picker = { enabled = true },
    }
  },
  {
    "NickvanDyke/opencode.nvim",
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        ask = {
          prompt = "Ask opencode: ",
          blink_cmp_sources = { "opencode", "buffer" },
          snacks = {
            icon = "󰚩 ",
            win = {
              backdrop = false,
              zindex = 50,
              position = "float",
              border = true,
              row = 3,
              title_pos = "center",
              height = 3,
              width = 60,
              relative = "cursor",
              wo = {
                winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
                cursorline = false,
                wrap = true,
                linebreak = true,
              },
              -- style = 'input',
            },
            expand = true,
          },
        },
        provider = {
          enabled = "snacks",
          snacks = {
            auto_close = true,
            win = {
              enter = false,
              border = true,
              wo = {
                winbar = "",
              },
              bo = {
                filetype = "opencode_terminal",
              },
            },
          }
        }
      }

      vim.o.autoread = true
      -- require("opencode").setup(vim.g.opencode_opts)
    end,
  },
}
