vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- show line numbers
vim.opt.number = true

-- show relative line numbers
vim.opt.relativenumber = true

-- minimal number of lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- highlight cursors current line
vim.opt.cursorline = true

-- enable 24bit color support
vim.opt.termguicolors = true

-- Preview substitutions live, as you type
vim.opt.inccommand = "split"

-- mouse support for all modes
vim.opt.mouse = "a"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.g.have_nerd_font = false

vim.opt.updatetime = 250

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- highlight what you just yanked
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
