-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.wo.number = true
-- vim.wo.relativenumber = false
vim.opt.clipboard = "unnamedplus"
vim.o.guifont = "JetBrainsMono Nerd Font:h13"
vim.g.neovide_transparency = 1
vim.cmd([[colorscheme tokyonight-storm]])
-- vim.g.neovide_window_blurred = true
-- vim.g.neovide_background_image = "/home/anqian/Pictures/bg.jpg"
--
--
--
-- 这段用来调整输入法的切换
local function toggle_input_method(mode)
  local handle = io.popen("fcitx-remote")
  if handle then
    local currentIM = handle:read("*l")
    handle:close()

    if mode == "normal" then
      -- 进入 Normal 模式时，切换到英文（1）
      vim.fn.system("fcitx-remote -c")
      vim.g.previousIM = currentIM -- 记录之前的输入法状态
    elseif mode == "insert" and vim.g.previousIM == "2" then
      -- 进入 Insert 模式时，如果之前是中文（2），则恢复
      vim.fn.system("fcitx-remote -o")
    end
  end
end

-- 进入 Normal 模式时，切换到英文输入法
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    toggle_input_method("normal")
  end,
})

-- 进入 Insert 模式时，如果之前是中文，则恢复中文
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    toggle_input_method("insert")
  end,
})
