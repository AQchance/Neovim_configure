local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
  init_options = {
    fallbackFlags = { "-std=c++23" },
  },
})
return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        clangd = {},
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- 需要 GitHub Copilot 支持
    },
    config = function()
      require("CopilotChat").setup({
        -- 这里可以自定义配置
      })
    end,
  },
}
