return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        progress = { enabled = false },  -- Отключаем прогресс LSP
        hover = {
          enabled = true,
          silent = true, -- не показывать сообщения
          view = "hover", -- использовать специальное представление
        },
        signature = { enabled = true },
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      messages = {
        enabled = true,
        view = "notify", -- Используем notify вместо mini
        view_error = "notify", -- Ошибки тоже через notify
        view_warn = "notify", -- Предупреждения через notify
      },
      notify = {
        enabled = true,
        view = "notify", -- Используем стандартный notify
      },
      popupmenu = {
        enabled = true, -- Включаем popup меню
        backend = "nui", -- Используем nui backend
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false, -- Отключаем всплывающие окна при переименовании
        lsp_doc_border = true, -- добавить рамку для документации
      },
      views = {
        cmdline_popup = {
          position = { row = "40%", col = "50%" },
          size = { width = 60, height = "auto" },
          border = { style = "rounded", padding = { 1, 2 } },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        hover = {
          border = {
            style = "rounded",
            padding = { 1, 2 },
          },
          position = { row = 2, col = 0 },
          size = {
            width = "auto",
            max_height = 20,
          },
        },
      },
      routes = {
        -- Скрываем некоторые частые сообщения
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "yanked",
          },
          opts = { skip = true },
        },
      },
    })
  end,
}
