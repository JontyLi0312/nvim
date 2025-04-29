return {
  name = "CMake Build",
  builder = function()
    local pwd = vim.fn.getcwd()
    return {
      cmd = { "cmake" },
      args = {
        "--build",
        pwd .. "/build", -- 指定构建目录
        "--target",
        "all", -- 构建所有目标
      },
      -- 解析输出并在 quickfix 窗口中显示错误/警告，但不自动打开 quickfix
      components = { { "on_output_quickfix", open = false }, "default" },
    }
  end,
  condition = {
    -- 仅在 C 或 C++ 文件类型时建议此任务
    -- filetype = { "c", "cpp" },
    -- 可以添加条件，例如检查 build 目录是否存在
    dir_exists = { "build" },
  },
}
