-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>ac", ":CopilotChatOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ap", ":CopilotChatPrompts<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>am", ":CopilotChatModels<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ar", ":CopilotChatReset<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>aa", ":CopilotChatAgents<CR>", { noremap = true, silent = true })

-- Example for configuring mappings in a Lua-based setup
require("CopilotChat").setup({
  mappings = {
    reset = {
      normal = "<C-x>", -- This maps 'submit_prompt' to '<Leader>s' in normal mode
      insert = "<C-x>", -- This maps 'submit_prompt' to 'C-s' in insert mode
    },
  },
})
