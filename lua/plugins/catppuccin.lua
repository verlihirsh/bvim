return {
  "catppuccin/nvim",
  lazy = false,
  config = function()
    vim.cmd.colorscheme("catppuccin-mocha")
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        functions = { "bold" },
        keywords = { "bold" },
        variables = { "italic" },
      },
      integrations = {
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        navic = {
          enabled = true,
          custom_bg = "NONE", -- "lualine" will set background to mantle
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        neotree = true,
        treesitter = true,
        lsp_trouble = true,
        telescope = true,
        gitsigns = true,
        which_key = true,
        cmp = true,
        notify = true,
        mini = true,
      },
    })
  end,
}
