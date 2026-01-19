local M = {}
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
local curl = require("plenary.curl")
local git_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1] or "no-git"
local git_status = vim.fn.systemlist("git status --porcelain")
local changed_files = #git_status
local lsp_clients = vim.lsp.get_clients()
local lsp = lsp_clients[1] and lsp_clients[1].name or "none"

local stats = require("lazy").stats()
local footer = "󱐋 Loaded " .. stats.count .. " plugins in " .. stats.startuptime .. "ms"

dashboard.section.header.val = {
[[   _        _         _              ]],
[[  (_)      | |       (_)             ]],
[[   _   ___ | |__   __ _  _ __ ___    ]],
[[  | | / _ \| |\ \ / /| || '_ ` _ \   ]],
[[  | ||  __/| | \ V / | || | | | | |  ]],
[[  | | \___||_|  \_/  |_||_| |_| |_|  ]],
[[ _/ |                                ]],
[[|__/                                 ]],
[[                                     ]],
  " ",
  "    Project: " .. cwd,
  "    Branch: " .. git_branch,
  "    Changed files: " .. changed_files,
  "    LSP: " .. lsp,
  -- "    Weather: " .. curl.get("https://wttr.in/?format=3").body,
  "    Date & Time: " .. os.date("%Y-%m-%d %H:%M:%S"),
  " ",
}

function M.open_projects_picker()
  local project_nvim = require("project_nvim")
  local projects = project_nvim.get_recent_projects()

  local items = {}
  for _, path in ipairs(projects) do
    local name = vim.fn.fnamemodify(path, ":t")
    table.insert(items, {
      text = name,
      file = path,
      preview = { text = path },
    })
  end

  Snacks.picker.pick({
    source = "projects",
    title = "Projects",
    items = items,
    format = function(item)
      return {
        { item.text, "SnacksPickerFile" },
        { "  " },
        { item.file, "SnacksPickerComment" },
      }
    end,
    confirm = function(picker, item)
      if not item then return end
      picker:close()
      vim.cmd("cd " .. item.file)
      vim.schedule(function()
        Snacks.picker.files()
      end)
    end,
  })
end

dashboard.section.buttons.val = {
  dashboard.button("n", "  New File", "<cmd>ene <BAR> startinsert<CR>"),
  dashboard.button("f", "  Find File", "<cmd>lua Snacks.picker.files()<CR>"),
  dashboard.button("g", "  Grep Text", "<cmd>lua Snacks.picker.grep()<CR>"),
  dashboard.button("p", "  Projects", "<cmd>lua require('dashboard').open_projects_picker()<CR>"),
  dashboard.button("s", " 󰒲 Restore Session", "<cmd>lua require('persistence').load({ last = true })<CR>"),
  dashboard.button("c", "  Config", string.format("<cmd>e %s/init.lua<CR>", vim.fn.stdpath("config"))),
  dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

dashboard.section.footer.val = footer
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

return M
