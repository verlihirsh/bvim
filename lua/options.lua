-- Отключаем интеграцию с системным буфером обмена
vim.opt.clipboard = ""

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Добавляем шорткаты для работы с системным буфером обмена
vim.keymap.set('n', 'ytc', '"+y', { noremap = true, desc = 'Copy to system clipboard' })
vim.keymap.set('v', 'ytc', '"+y', { noremap = true, desc = 'Copy to system clipboard' })
vim.keymap.set('n', 'pfc', '"+p', { noremap = true, desc = 'Paste from system clipboard' })
vim.keymap.set('v', 'pfc', '"+p', { desc = 'Paste from system clipboard' })

-- Настройки отображения
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }  -- Убираем тильды


-- Настройки отступов
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Настройки поиска
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Настройки для улучшенного UX
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Настройки для файлов
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.fileencoding = "utf-8"

-- Поддержка русской раскладки
vim.cmd [[
  set langmap+=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
  set langmap+=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
  set langmap+=ЖжЭэХхЪъ;\:\;\"\'{[}]
]]

-- Упрощенная настройка курсора
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Автоматическое создание директорий при сохранении
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Отключаем предупреждение о deprecated функциях
vim.g.VM_set_silent_exit = 1

