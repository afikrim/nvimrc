return {
  {
    "hedyhli/outline.nvim",
    lazy = false,
    config = function()
      require("outline").setup({})
    end,
    keys = {
      {
        "<leader>fo",
        function()
          require("outline").toggle({ focus_outline = true })
        end,
        desc = "File Outline",
      },
    },
  },
}
