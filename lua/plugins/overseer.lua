return {
  "stevearc/overseer.nvim",
  cmd = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearCache",
  },
  config = function()
    local overseer = require("overseer")
    overseer.setup({
      dap = false,
      templates = {
        "user.build",
        "user.clean",
        "user.configure",
        "user.openocd_flash_stm32h7",
        -- "builtin",
        -- "user.openocd_load_jlink_stm32f1",
      },
      task_list = {
        bindings = {
          ["<C-h>"] = false,
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<C-l>"] = false,
        },
      },
      form = {
        win_opts = {
          winblend = 0,
        },
      },
      confirm = {
        win_opts = {
          winblend = 0,
        },
      },
      task_win = {
        win_opts = {
          winblend = 0,
        },
      },
    })

    -- overseer.add_template_hook({
    --   module = "^make$",
    -- }, function(task_defn, util)
    --   util.add_component(task_defn, { "on_output_quickfix", open_on_exit = "failure" })
    --   util.add_component(task_defn, "on_complete_notify")
    --   util.add_component(task_defn, { "display_duration", detail_level = 1 })
    -- end)
  end,
  -- stylua: ignore
  -- keys = {
  --   { "<leader>ow", "<cmd>OverseerToggle<cr>",      desc = "Task list" },
  --   { "<leader>oo", "<cmd>OverseerRun<cr>",         desc = "Run task" },
  --   { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
  --   { "<leader>oi", "<cmd>OverseerInfo<cr>",        desc = "Overseer Info" },
  --   { "<leader>ob", "<cmd>OverseerBuild<cr>",       desc = "Task builder" },
  --   { "<leader>ot", "<cmd>OverseerTaskAction<cr>",  desc = "Task action" },
  --   { "<leader>oc", "<cmd>OverseerClearCache<cr>",  desc = "Clear cache" },
  -- },
}
