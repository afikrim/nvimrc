return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.hide_root_node = true
    opts.filesystem.filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    }
  end,
}
