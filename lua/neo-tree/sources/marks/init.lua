local renderer = require("neo-tree.ui.renderer")
local manager = require("neo-tree.sources.manager")
local events = require("neo-tree.events")

local M = {
  name = "marks",
  display_name = " Marks",
}

---@return table[]
local function get_marks()
  local marks = {}
  local seen = {}

  local global_marks = vim.fn.getmarklist()
  for _, m in ipairs(global_marks) do
    local mark_name = m.mark:sub(2)
    if mark_name:match("^[A-Z0-9]$") and m.file and m.file ~= "" then
      local file = vim.fn.fnamemodify(m.file, ":p")
      local display_file = vim.fn.fnamemodify(file, ":~:.")
      local key = mark_name .. file
      if not seen[key] then
        seen[key] = true
        table.insert(marks, {
          mark = mark_name,
          file = file,
          display_file = display_file,
          line = m.pos[2],
          col = m.pos[3],
          is_global = true,
        })
      end
    end
  end

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname ~= "" then
        local buf_marks = vim.fn.getmarklist(bufnr)
        for _, m in ipairs(buf_marks) do
          local mark_name = m.mark:sub(2)
          if mark_name:match("^[a-z]$") then
            local file = vim.fn.fnamemodify(bufname, ":p")
            local display_file = vim.fn.fnamemodify(file, ":~:.")
            local key = mark_name .. file
            if not seen[key] then
              seen[key] = true
              table.insert(marks, {
                mark = mark_name,
                file = file,
                display_file = display_file,
                line = m.pos[2],
                col = m.pos[3],
                is_global = false,
              })
            end
          end
        end
      end
    end
  end

  table.sort(marks, function(a, b)
    if a.is_global ~= b.is_global then
      return a.is_global
    end
    return a.mark < b.mark
  end)

  return marks
end

--- Convert marks to neo-tree item structure
---@param marks table[] List of marks
---@return table[] Neo-tree items
local function marks_to_items(marks)
  local global_marks = {}
  local local_marks = {}

  for _, m in ipairs(marks) do
    local item = {
      id = "mark_" .. m.mark,
      name = string.format("[%s] %s:%d", m.mark, m.display_file, m.line),
      type = "file",
      path = m.file,
      extra = {
        mark = m.mark,
        line = m.line,
        col = m.col,
        position = { m.line - 1, 0 }, -- 0-indexed for preview
        end_position = { m.line, 0 },
      },
    }

    if m.is_global then
      table.insert(global_marks, item)
    else
      table.insert(local_marks, item)
    end
  end

  local items = {}

  if #global_marks > 0 then
    table.insert(items, {
      id = "global_marks",
      name = "Global Marks (A-Z)",
      type = "directory",
      children = global_marks,
    })
  end

  if #local_marks > 0 then
    table.insert(items, {
      id = "local_marks",
      name = "Buffer Marks (a-z)",
      type = "directory",
      children = local_marks,
    })
  end

  if #items == 0 then
    table.insert(items, {
      id = "no_marks",
      name = "No marks set",
      type = "file",
    })
  end

  return items
end

---Navigate to marks view
---@param state table Neo-tree state
---@param path string|nil Unused, kept for API compatibility
M.navigate = function(state, path)
  state.path = vim.fn.getcwd()
  local marks = get_marks()
  local items = marks_to_items(marks)
  renderer.show_nodes(items, state)
end

---Setup the marks source
---@param config table Configuration
---@param global_config table Global neo-tree config
M.setup = function(config, global_config)
  manager.subscribe(M.name, {
    event = events.VIM_BUFFER_ENTER,
    handler = function()
      manager.refresh(M.name)
    end,
  })
end

return M
