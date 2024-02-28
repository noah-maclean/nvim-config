-- sets tab to be 4 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- set leader to be space
vim.g.mapleader = " "

-- set numbers on the side and make them relative
vim.opt.nu = true
vim.opt.rnu = true

-- enable scrolloff (keeps the bottom/top of file x number of lines away from cursor)
vim.opt.scrolloff = 12
