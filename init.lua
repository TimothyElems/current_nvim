vim.g.mapleader = " "
vim.g.maplocalleader = ","
_G.vnext = {}
require("vnext.config")
require("bufferline").setup{}
require("mason").setup()
require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})

-- init.lua for vanilla Neovim
-- Converted from NvChad configuration

-- Basic Options
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.termguicolors = true    -- Enable true color support
vim.opt.cursorline = true       -- Highlight current line
vim.opt.splitbelow = true       -- Open horizontal splits below
vim.opt.splitright = true       -- Open vertical splits to the right

