return {
  name = "CMake Clean Build",
  builder = function()
    local pwd = vim.fn.getcwd()
    return {
      cmd = { "cmake" },
      args = {
        "--build",
        pwd .. "/build", -- 指定构建目录
        "--target",
        "clean", -- 执行 clean 目标
      },
      -- 清理任务通常不需要问题匹配器，但保留默认组件以获得标准 UI
      components = { "default" },
    }
  end,
  condition = {
    -- 仅在 C 或 C++ 文件类型时建议此任务
    -- filetype = { "c", "cpp" },
    -- 可以添加条件，例如检查 build 目录是否存在
    dir_exists = { "build" },
  },
}
