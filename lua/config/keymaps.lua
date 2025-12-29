-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.api.nvim_set_keymap("n", "<leader>ac", ":CopilotChatOpen<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>ap", ":CopilotChatPrompts<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>am", ":CopilotChatModels<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>ar", ":CopilotChatReset<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>aa", ":CopilotChatAgents<CR>", { noremap = true, silent = true })

-- 普通模式下 C-n 映射为 C-a
vim.keymap.set("n", "<C-n>", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<C-x>", { noremap = true, silent = true })

-- Normal模式下的行首行尾跳转
-- vim.api.nvim_set_keymap("n", "<C-a>", "0", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-e>", "$", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-a>", "0", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-e>", "$", { noremap = true, silent = true })

-- Example for configuring mappings in a Lua-based setup
require("CopilotChat").setup({
  mappings = {
    reset = {
      normal = "<C-x>", -- This maps 'submit_prompt' to '<Leader>s' in normal mode
      insert = "<C-x>", -- This maps 'submit_prompt' to 'C-s' in insert mode
    },
  },
  prompts = {
    aa = {
      prompt = "解释代码如何工作",
      description = "解释代码",
    },
    ab = {
      prompt = "帮我修改一下代码，让代码更加高效健壮",
      description = "重构代码",
    },
    ac = {
      prompt = "为我的代码添加一些注释",
      description = "添加注释",
    },
    ad = {
      prompt = "修改我的代码中的BUG以及错误",
      description = "纠正错误",
    },
    ae = {
      prompt = "为我的代码添加一些测试用例",
      description = "添加测试",
    },
  },
  sticky = {
    "@copilot 你可以读取工作空间的文件内容",
    "@models 总是使用中文回答问题",
  },
})

-- yazi插件需要修改一下快捷键
vim.api.nvim_set_keymap("n", "<M-Up>", ":Yazi toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gh", ":Ouroboros<CR>", { noremap = true, silent = true })
require("ouroboros").setup({
  extension_preferences_table = {
    -- Higher numbers are a heavier weight and thus preferred.
    -- In the following, .c would prefer to open .h before .hpp
    c = { h = 2, hpp = 1 },
    h = { c = 2, cpp = 1 },
    cpp = { hpp = 2, h = 1 },
    hpp = { cpp = 1, c = 2 },

    -- Ouroboros supports any combination of filetypes you like, simply
    -- add them as desired:
    -- myext = { myextsrc = 2, myextoldsrc = 1},
    -- tpp = {hpp = 2, h = 1},
    -- inl = {cpp = 3, hpp = 2, h = 1},
    -- cu = {cuh = 3, hpp = 2, h = 1},
    -- cuh = {cu = 1}
  },
  -- if this is true and the matching file is already open in a pane, we'll
  -- switch to that pane instead of opening it in the current buffer
  switch_to_open_pane_if_possible = false,
})
