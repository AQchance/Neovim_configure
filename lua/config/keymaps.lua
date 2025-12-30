-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 普通模式下 C-n 映射为 C-a
vim.keymap.set("n", "<C-n>", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<C-x>", { noremap = true, silent = true })

-- Normal模式下的行首行尾跳转
-- vim.api.nvim_set_keymap("n", "<C-a>", "0", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-e>", "$", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-a>", "0", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-e>", "$", { noremap = true, silent = true })

-- yazi插件需要修改一下快捷键
vim.api.nvim_set_keymap("n", "<M-Up>", ":Yazi toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })

-- clangd头文件与cpp之间切换
vim.api.nvim_set_keymap("n", "gh", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>th", ":ClangdTypeHierarchy<CR>", { noremap = true, silent = true })
