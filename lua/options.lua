-- Clipboard: disabled by default, use ytc/pfc keymaps for explicit access
vim.opt.clipboard = ""

-- Display
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UX
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.fileencoding = "utf-8"

-- Russian keyboard layout support
vim.cmd [[
  set langmap+=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
  set langmap+=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
  set langmap+=ЖжЭэХхЪъ;\:\;\"\'{[}]
]]

-- Cursor shape
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Auto-create directories on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

vim.g.VM_set_silent_exit = 1
