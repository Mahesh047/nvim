return {
  "EthanJWright/vs-tasks.nvim",
  lazy = false,
  keys = {
    {
      "<Leader>ta",
      function()
        require("telescope").extensions.vstask.tasks()
      end,
      desc = "Show tasks",
    },
    {
      "<Leader>ti",
      function()
        require("telescope").extensions.vstask.inputs()
      end,
      desc = "Show inputs",
    },
    {
      "<Leader>th",
      function()
        require("telescope").extensions.vstask.history()
      end,
      desc = "Show history",
    },
    {
      "<Leader>tl",
      function()
        require("telescope").extensions.vstask.launch()
      end,
      desc = "Launch task",
    },
  },
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
