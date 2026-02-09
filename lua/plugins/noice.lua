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
        progress = { enabled = false },
        hover = {
          enabled = true,
          silent = true,
          view = "hover",
        },
        signature = { enabled = true },
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
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
