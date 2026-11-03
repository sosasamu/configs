vim.g.mapleader = " "

vim.opt.title = true
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.scrolloff = 10
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.breakindent = true
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitkeep = "cursor"

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Disable LazyVim's automatic format-on-save (use <leader>cf to format manually)
vim.g.autoformat = false
