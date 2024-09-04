return {
  {
    "microsoft/vscode-js-debug",
    opt = true, -- Set this to true if you want to lazy-load the plugin
    event = "VeryLazy",
    build = function()
      local current_dir = vim.fn.getcwd()

      vim.fn.chdir(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug")
      -- Define the commands to run after the plugin is installed
      vim.fn.system("npm install --legacy-peer-deps")
      vim.fn.system("npx gulp vsDebugServerBundle")
      vim.fn.system("mv dist out")

      vim.fn.chdir(current_dir)
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    opts = {
      node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
      -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
      -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      local dap_utils = require("dap.utils")

      local exts = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        -- using pwa-chrome
        "vue",
        "svelte",
      }

      for _, ext in ipairs(exts) do
        dap.configurations[ext] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node)",
            cwd = vim.fn.getcwd(),
            args = { "${file}" },
            sourceMaps = true,
            protocol = "inspector",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node with ts-node)",
            cwd = vim.fn.getcwd(),
            args = { "${file}" },
            runtimeArgs = { "--require", "ts-node/register" },
            runtimeExecutable = "node",
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node with ts-node & dotenv)",
            cwd = vim.fn.getcwd(),
            args = { "${file}" },
            runtimeArgs = { "--require", "ts-node/register", "--require", "dotenv/config" },
            runtimeExecutable = "node",
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (pwa-node with nodemon & dotenv)",
            cwd = vim.fn.getcwd(),
            args = { "${file}" },
            runtimeArgs = { "--require", "ts-node/register", "--require", "dotenv/config" },
            runtimeExecutable = "${workspaceFolder}/node_modules/.bin/nodemon",
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current Project (pwa-node with next)",
            cwd = vim.fn.getcwd(),
            program = "${workspaceFolder}/node_modules/next/dist/bin/next",
            args = { "dev" },
            console = "integratedTerminal",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Test Current File (pwa-node with jest)",
            cwd = vim.fn.getcwd(),
            runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
            runtimeExecutable = "node",
            args = { "${file}", "--coverage", "false" },
            rootPath = "${workspaceFolder}",
            sourceMaps = true,
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Test Current File (pwa-node with vitest)",
            cwd = vim.fn.getcwd(),
            program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
            args = { "--inspect-brk", "--threads", "false", "run", "${file}" },
            autoAttachChildProcesses = true,
            smartStep = true,
            console = "integratedTerminal",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Program (pwa-chrome, select port)",
            cwd = vim.fn.getcwd(),
            console = "integratedTerminal",
            url = function()
              return vim.fn.input("Set URL: ", "http://localhost:3000")
            end,
          },
          {
            type = "pwa-chrome",
            request = "attach",
            name = "Attach Program (pwa-chrome, select port)",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            port = function()
              return vim.fn.input("Select port: ", 9222)
            end,
            webRoot = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach Program (pwa-node, select pid)",
            cwd = vim.fn.getcwd(),
            processId = dap_utils.pick_process,
            skipFiles = { "<node_internals>/**" },
          },
        }
      end
    end,
  },
}
