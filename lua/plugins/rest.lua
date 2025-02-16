return {
  {
    "rest-nvim/rest.nvim",
    keys = {
      { "<leader>r", "", desc = "Rest" },
      { "<leader>ro", "<cmd>Rest open<cr>", desc = "Open result pane" },
      { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run request under the cursor" },
      {
        "<leader>rn",
        function()
          local req_name = vim.fn.input("Request name: ")
          vim.cmd("Rest run " .. req_name)
        end,
        desc = "Run request with name",
      },
      { "<leader>rl", "<cmd>Rest last<cr>", desc = "Run last request" },
      { "<leader>re", "", desc = "Rest env" },
      { "<leader>rev", "<cmd>Rest env show<cr>", desc = "Show dotenv file registered to current .http file" },
      { "<leader>res", "<cmd>Rest env select<cr>", desc = "Select & register .env file" },
      {
        "<leader>reS",
        function()
          local path = vim.fn.input("Path: ")
          vim.cmd("Rest env set " .. path)
        end,
        desc = "Register .env file to current .http file",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
  },
}
