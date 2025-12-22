-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false -- 覆盖默认的 true
    vim.opt.conceallevel = 0
  end,
})

-- lua/config/autocmds.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function(args)
    if vim.api.nvim_buf_get_name(args.buf):match("xmake%.lua$") then
      vim.defer_fn(function()
        vim.cmd("LspStop")
      end, 200)
    end
  end,
})

-- 当打开 xmake.lua 文件时，禁用自动格式化
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "xmake.lua",
  callback = function()
    vim.b.autoformat = false
  end,
})
