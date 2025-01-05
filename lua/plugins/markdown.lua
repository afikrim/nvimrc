return {
  {
    "OXY2DEV/markview.nvim",
    lazy = true, -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway

    keys = {
      { "<leader>m", "", desc = "+markview" },
      { "<leader>mt", "<cmd>Markview toggle<cr>", desc = "Toggle Markdown Preview" },
      { "<leader>ms", "<cmd>Markview splitToggle<cr>", desc = "Toggle Split Markdown Preview" },
    },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    lazy = true, -- Recommended
    ft = { "markdown" },
  },
}
