return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "˙", "<cmd>TmuxNavigateLeft<cr>" },
      { "∆", "<cmd>TmuxNavigateDown<cr>" },
      { "˚", "<cmd>TmuxNavigateUp<cr>" },
      { "¬", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },
}
