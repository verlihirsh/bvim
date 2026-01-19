local highlights = require("neo-tree.ui.highlights")
local common = require("neo-tree.sources.common.components")

local M = {}

M.icon = function(config, node, state)
  local icon = ""
  local highlight = highlights.FILE_ICON

  if node.type == "directory" then
    icon = node:is_expanded() and "" or ""
    highlight = highlights.DIRECTORY_ICON
  end

  return {
    text = icon .. " ",
    highlight = highlight,
  }
end

M.name = function(config, node, state)
  local highlight = highlights.FILE_NAME
  if node.type == "directory" then
    highlight = highlights.DIRECTORY_NAME
  end
  return {
    text = node.name,
    highlight = highlight,
  }
end

M.clipboard = function(config, node, state)
  return { text = "" }
end

M.bufnr = function(config, node, state)
  return { text = "" }
end

M.git_status = function(config, node, state)
  return { text = "" }
end

M.modified = function(config, node, state)
  return { text = "" }
end

M.diagnostics = function(config, node, state)
  return { text = "" }
end

M.file_size = function(config, node, state)
  return { text = "" }
end

M.indent = common.indent
M.container = common.container

return M
