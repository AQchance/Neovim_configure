-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>ac", ":CopilotChatOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ap", ":CopilotChatPrompts<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>am", ":CopilotChatModels<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ar", ":CopilotChatReset<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>aa", ":CopilotChatAgents<CR>", { noremap = true, silent = true })

-- Normal模式下的行首行尾跳转
vim.api.nvim_set_keymap("n", "<C-a>", "0", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "0", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-e>", "$", { noremap = true, silent = true })

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
})
