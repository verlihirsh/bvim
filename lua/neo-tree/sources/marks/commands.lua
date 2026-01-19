local manager = require("neo-tree.sources.manager")
local cc = require("neo-tree.sources.common.commands")

local M = {}

M.refresh = function(state)
  manager.refresh("marks")
end

M.open = function(state)
  local node = state.tree:get_node()
  if not node or not node.extra or not node.extra.mark then
    cc.toggle_node(state)
    return
  end

  local path = node.path
  local line = node.extra.line
  local col = node.extra.col

  if path and vim.fn.filereadable(path) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(path))
    if line then
      local line_count = vim.api.nvim_buf_line_count(0)
      local safe_line = math.min(line, line_count)
      local line_text = vim.api.nvim_buf_get_lines(0, safe_line - 1, safe_line, false)[1] or ""
      local safe_col = math.min(col or 0, #line_text)
      vim.api.nvim_win_set_cursor(0, { safe_line, safe_col })
    end
  end
end

M.open_split = function(state)
  local node = state.tree:get_node()
  if not node or not node.extra or not node.extra.mark then
    return
  end

  local path = node.path
  local line = node.extra.line
  local col = node.extra.col

  if path and vim.fn.filereadable(path) == 1 then
    vim.cmd("split " .. vim.fn.fnameescape(path))
    if line then
      local line_count = vim.api.nvim_buf_line_count(0)
      local safe_line = math.min(line, line_count)
      local line_text = vim.api.nvim_buf_get_lines(0, safe_line - 1, safe_line, false)[1] or ""
      local safe_col = math.min(col or 0, #line_text)
      vim.api.nvim_win_set_cursor(0, { safe_line, safe_col })
    end
  end
end

M.open_vsplit = function(state)
  local node = state.tree:get_node()
  if not node or not node.extra or not node.extra.mark then
    return
  end

  local path = node.path
  local line = node.extra.line
  local col = node.extra.col

  if path and vim.fn.filereadable(path) == 1 then
    vim.cmd("vsplit " .. vim.fn.fnameescape(path))
    if line then
      local line_count = vim.api.nvim_buf_line_count(0)
      local safe_line = math.min(line, line_count)
      local line_text = vim.api.nvim_buf_get_lines(0, safe_line - 1, safe_line, false)[1] or ""
      local safe_col = math.min(col or 0, #line_text)
      vim.api.nvim_win_set_cursor(0, { safe_line, safe_col })
    end
  end
end

M.delete_mark = function(state)
  local node = state.tree:get_node()
  if not node or not node.extra or not node.extra.mark then
    return
  end

  local mark = node.extra.mark
  vim.cmd("delmarks " .. mark)
  manager.refresh("marks")
end

M.toggle_node = cc.toggle_node
M.close_window = cc.close_window
M.cancel = cc.cancel
M.show_help = cc.show_help
M.close_node = cc.close_node
M.close_all_nodes = cc.close_all_nodes
M.open_tabnew = cc.open_tabnew
M.toggle_preview = cc.toggle_preview
M.focus_preview = cc.focus_preview
M.scroll_preview = cc.scroll_preview
M.prev_source = cc.prev_source
M.next_source = cc.next_source
M.toggle_auto_expand_width = cc.toggle_auto_expand_width

M.noop = function() end

M.copy = M.noop
M.paste_from_clipboard = M.noop
M.move = M.noop
M.copy_to_clipboard = M.noop
M.cut_to_clipboard = M.noop
M.add_directory = M.noop
M.add = M.noop
M.open_with_window_picker = M.noop

return M
