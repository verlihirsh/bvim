local wk = require("which-key")

wk.setup({})

wk.add({
  { "<leader>f", group = "File" },
  { "<leader>ff", function() Snacks.picker.files() end, desc = "Find File" },
  { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Text" },
  { "<leader>fn", "<cmd>ene<CR>", desc = "New File" },

  { "<leader>b", group = "Buffers" },
  { "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete buffer" },
  { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
  { "<leader>bf", function() Snacks.picker.buffers() end, desc = "Find buffer" },
  { "<leader>bb", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
  { "<leader>bD", "<cmd>silent! %bdelete<CR>", desc = "Delete all" },
  { "<leader>bc", group = "Close" },
  { "<leader>bco", "<cmd>BufferLineCloseOthers<CR>", desc = "Close others" },
  { "<leader>bcr", "<cmd>BufferLineCloseRight<CR>", desc = "Close right" },
  { "<leader>bcl", "<cmd>BufferLineCloseLeft<CR>", desc = "Close left" },

  { "<leader>g", group = "Git" },
  { "<leader>gg", "<cmd>Git status<CR>", desc = "Status" },
  { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "File history" },
  { "<leader>gb", group = "Branch" },
  { "<leader>gbb", function() Snacks.picker.git_branches() end, desc = "List branches" },
  { "<leader>gbn", function()
    vim.ui.input({ prompt = 'Branch name: ' }, function(name)
      if name then vim.cmd('Git branch ' .. name) end
    end)
  end, desc = "New branch" },
  { "<leader>gl", group = "Blame" },
  { "<leader>gll", "<cmd>Gitsigns blame_line<CR>", desc = "Blame line" },
  { "<leader>glf", function() require('gitsigns').blame() end, desc = "Blame file" },
  { "<leader>gc", group = "Commit" },
  { "<leader>gch", function() Snacks.picker.git_log() end, desc = "History" },
  { "<leader>gcam", function()
    vim.cmd('Git add .')
    vim.ui.input({ prompt = 'Commit message: ' }, function(msg)
      if msg then vim.cmd(string.format('Git commit -m "%s"', msg)) end
    end)
  end, desc = "Add all & commit" },
  { "<leader>gcama", function()
    vim.cmd('Git add .')
    require("opencode").ask("@diff: make a commin on this changes", { submit = true })
  end, desc = "Add all & commit using llm" },
  { "<leader>gs", group = "Stash" },
  { "<leader>gss", "<cmd>Git stash<CR>", desc = "Stash" },
  { "<leader>gsp", "<cmd>Git stash pop<CR>", desc = "Pop" },
  { "<leader>gp", group = "Push" },
  { "<leader>gpp", "<cmd>Git push<CR>", desc = "Push" },
  { "<leader>gpsup", function()
    local branch = vim.fn.system("git branch --show-current"):gsub("\n", "")
    vim.cmd('Git push --set-upstream origin ' .. branch)
  end, desc = "Push & set upstream" },
  { "<leader>gd", group = "Diff" },
  { "<leader>gds", function() Snacks.picker.git_status() end, desc = "Changed files" },
  { "<leader>gdv", "<cmd>DiffviewOpen<CR>", desc = "Diffview" },
  { "<leader>gdh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
  { "<leader>gdH", "<cmd>DiffviewFileHistory<CR>", desc = "Branch history" },
  { "<leader>gdq", "<cmd>DiffviewClose<CR>", desc = "Close diffview" },

  { "<leader>c", group = "Code" },
  { "<leader>ca", desc = "Code action" },
  { "<leader>cr", desc = "Rename symbol" },
  { "<leader>cf", desc = "Format" },
  { "<leader>cl", desc = "Run codelens" },
  { "<leader>cL", desc = "Refresh codelens" },
  { "<leader>ch", desc = "Toggle inlay hints" },
  { "<leader>co", desc = "Organize imports" },
  { "<leader>cd", function()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "binding.irb" })
  end, desc = "Insert binding.irb" },
  { "<leader>cs", group = "Symbols" },
  { "<leader>csd", desc = "Document symbols" },
  { "<leader>csw", desc = "Workspace symbols" },

  { "<leader>l", group = "Diagnostics" },
  { "<leader>ld", desc = "Line diagnostic" },
  { "<leader>lb", desc = "Buffer diagnostics" },
  { "<leader>lw", desc = "Workspace diagnostics" },

  { "<leader>a", group = "AI" },
  { "<leader>aa", function()
    require("opencode.provider").start()
    vim.defer_fn(function()
      require("opencode").ask("@this: ", { submit = true })
    end, 500)
  end, desc = "Ask about this", mode = { "n", "v" } },
  { "<leader>ae", function() require("opencode").select() end, desc = "Select action" },
  { "<leader>at", function() require("opencode").toggle() end, desc = "Toggle panel" },
  { "<leader>ao", group = "Navigation" },
  { "<leader>aou", function() require("opencode").command("session.half.page.up") end, desc = "Half page up" },
  { "<leader>aod", function() require("opencode").command("session.half.page.down") end, desc = "Half page down" },

  { "<leader>e", group = "Explorer" },
  {
    "<leader>ee",
    function()
      local current_ft = vim.bo.filetype
      if current_ft == "neo-tree" then
        -- vim.cmd("Neotree close")
        require("edgy").goto_main()
      else
        -- vim.cmd("Neotree focus last left")
        require("edgy").select("left")
      end
    end,
    desc = "Toggle Explorer",
  },
  { "<leader>ee", "<cmd>Neotree toggle last left<CR>", desc = "Toggle Explorer" },
  { "<leader>ef", "<cmd>Neotree focus filesystem left reveal<CR>", desc = "Focus Files" },
  { "<leader>eb", "<cmd>Neotree focus buffers left<CR>", desc = "Focus Buffers" },
  { "<leader>eg", "<cmd>Neotree focus git_status left<CR>", desc = "Focus Git" },
  { "<leader>es", "<cmd>Neotree focus document_symbols left<CR>", desc = "Focus Symbols" },
  { "<leader>em", "<cmd>Neotree focus marks <CR>", desc = "Focus marks" },
  { "<leader>el", function() require("edgy").toggle("left") end, desc = "toggle left" },
  { "<leader>er", function() require("edgy").toggle("right") end, desc = "toggle right" },
  { "<leader>en", "<C-w>w", desc = "Cycle windows" },
  { "<leader>et", function() Snacks.terminal() end, desc = "Toggle Terminal" },

  { "<leader>q", group = "Session" },
  { "<leader>qq", "<cmd>qa!<CR>", desc = "Quit without saving" },
  { "<leader>qwq", "<cmd>wa<CR><cmd>qa<CR>", desc = "Save all and quit" },

  { "<leader>t", group = "Timer" },
  { "<leader>ts", group = "Session" },
  { "<leader>ts2", "<cmd>TimerSession default2h<CR>", desc = "2h focus" },
  { "<leader>ts1", "<cmd>TimerSession default1h<CR>", desc = "1h focus" },
  { "<leader>tsr", "<cmd>TimerSession rest<CR>", desc = "Rest" },
  { "<leader>tt", group = "Timer" },
  { "<leader>tts", "<cmd>TimerStop<CR>", desc = "Stop" },
  { "<leader>ttp", "<cmd>TimerPause<CR>", desc = "Pause" },
  { "<leader>ttr", "<cmd>TimerResume<CR>", desc = "Resume" },
  { "<leader>ttc", function()
    vim.ui.input({ prompt = 'Minutes: ' }, function(m)
      if m then vim.cmd('TimerStart ' .. m) end
    end)
  end, desc = "Custom" },

  { "<leader>p", group = "Pickers" },
  -- Files
  { "<leader>pf", function() Snacks.picker.files() end, desc = "Files" },
  { "<leader>pr", function() Snacks.picker.recent() end, desc = "Recent files" },
  { "<leader>ps", function() Snacks.picker.smart() end, desc = "Smart find" },
  { "<leader>pb", function() Snacks.picker.buffers() end, desc = "Buffers" },
  { "<leader>pp", function() Snacks.picker.projects() end, desc = "Projects" },
  { "<leader>pe", function() Snacks.picker.explorer() end, desc = "Explorer" },
  { "<leader>pz", function() Snacks.picker.zoxide() end, desc = "Zoxide dirs" },
  -- Search
  { "<leader>pg", function() Snacks.picker.grep() end, desc = "Grep" },
  { "<leader>pG", function() Snacks.picker.grep_buffers() end, desc = "Grep buffers" },
  { "<leader>pw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
  { "<leader>pl", function() Snacks.picker.lines() end, desc = "Buffer lines" },
  -- Git
  { "<leader>pv", group = "Git" },
  { "<leader>pvs", function() Snacks.picker.git_status() end, desc = "Status" },
  { "<leader>pvb", function() Snacks.picker.git_branches() end, desc = "Branches" },
  { "<leader>pvl", function() Snacks.picker.git_log() end, desc = "Log" },
  { "<leader>pvf", function() Snacks.picker.git_log_file() end, desc = "File log" },
  { "<leader>pvS", function() Snacks.picker.git_stash() end, desc = "Stash" },
  { "<leader>pvd", function() Snacks.picker.git_diff() end, desc = "Diff" },
  -- Neovim
  { "<leader>pn", group = "Neovim" },
  { "<leader>pnc", function() Snacks.picker.commands() end, desc = "Commands" },
  { "<leader>pnh", function() Snacks.picker.command_history() end, desc = "Command history" },
  { "<leader>pns", function() Snacks.picker.search_history() end, desc = "Search history" },
  { "<leader>pnk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
  { "<leader>pna", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
  { "<leader>pnH", function() Snacks.picker.highlights() end, desc = "Highlights" },
  { "<leader>pnC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
  { "<leader>pno", function() Snacks.picker.options() end, desc = "Options" },
  -- Help
  { "<leader>ph", group = "Help" },
  { "<leader>phh", function() Snacks.picker.help() end, desc = "Help tags" },
  { "<leader>phm", function() Snacks.picker.man() end, desc = "Man pages" },
  -- Navigation
  { "<leader>pm", function() Snacks.picker.marks() end, desc = "Marks" },
  { "<leader>p'", function() Snacks.picker.registers() end, desc = "Registers" },
  { "<leader>pj", function() Snacks.picker.jumps() end, desc = "Jumps" },
  { "<leader>pq", function() Snacks.picker.qflist() end, desc = "Quickfix" },
  { "<leader>pL", function() Snacks.picker.loclist() end, desc = "Location list" },
  -- Misc
  { "<leader>pu", function() Snacks.picker.undo() end, desc = "Undo history" },
  { "<leader>pi", function() Snacks.picker.icons() end, desc = "Icons" },
  { "<leader>pS", function() Snacks.picker.spelling() end, desc = "Spelling" },
  { "<leader>pN", function() Snacks.picker.notifications() end, desc = "Notifications" },
  { "<leader>pT", function() Snacks.picker.todo_comments() end, desc = "TODOs" },
  { "<leader>pY", function() Snacks.picker.lazy() end, desc = "Lazy plugins" },
  { "<leader>p.", function() Snacks.picker.resume() end, desc = "Resume last" },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end

    local bufnr = ev.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc })
    end

    map("n", "gd", function() Snacks.picker.lsp_definitions() end, "Go to definition")
    map("n", "gr", function() Snacks.picker.lsp_references() end, "References")
    map("n", "gi", function() Snacks.picker.lsp_implementations() end, "Implementations")
    map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, "Type definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gci", function() Snacks.picker.lsp_incoming_calls() end, "Incoming calls")
    map("n", "gco", function() Snacks.picker.lsp_outgoing_calls() end, "Outgoing calls")

    map("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded", max_width = 80 })
    end, "Hover")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("v", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")
    map("n", "<leader>cl", vim.lsp.codelens.run, "Run codelens")
    map("n", "<leader>cL", vim.lsp.codelens.refresh, "Refresh codelens")
    map("n", "<leader>ch", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end, "Toggle inlay hints")
    map("n", "<leader>csd", function() Snacks.picker.lsp_symbols() end, "Document symbols")
    map("n", "<leader>csw", function() Snacks.picker.lsp_workspace_symbols() end, "Workspace symbols")

    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
    map("n", "<leader>lb", function() Snacks.picker.diagnostics_buffer() end, "Buffer diagnostics")
    map("n", "<leader>lw", function() Snacks.picker.diagnostics() end, "Workspace diagnostics")

    if client.name == 'ts_ls' or client.name == 'svelte' or client.name == 'vue_ls' then
      vim.api.nvim_buf_create_user_command(bufnr, 'LspSourceAction', function()
        vim.lsp.buf.code_action({ context = { only = { 'source' } } })
      end, { desc = "Source actions (organize imports, etc.)" })
      map("n", "<leader>co", "<cmd>LspSourceAction<CR>", "Organize imports")
    end
  end,
})

-- vim.api.nvim_create_autocmd('TermOpen', {
--   callback = function(args)
--     vim.keymap.set('t', '<Space>`', [[<C-\><C-n>]], { buffer = args.buf })
--   end,
-- })
