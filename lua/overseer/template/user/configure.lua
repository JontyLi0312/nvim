return {
  name = "CMake Configure",
  builder = function()
    local pwd = vim.fn.getcwd()
    return {
      cmd = { "cmake" },
      args = {
        "-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE",
        "-GNinja",
        "-B",
        pwd .. "/build", -- 使用当前工作目录下的 build 文件夹
        "-S",
        pwd, -- 指定源码目录为当前工作目录 (可选，但明确指定更好)
      },
      -- 解析输出并在 quickfix 窗口中显示错误/警告，但不自动打开 quickfix
      components = { { "on_output_quickfix", open = false }, "default" },
    }
  end,
  condition = {
    -- 仅在 C 或 C++ 文件类型时建议此任务
    -- filetype = { "c", "cpp" },
    -- 可以添加其他条件，例如检查 CMakeLists.txt 是否存在
    file_exists = { "CMakeLists.txt" },
  },
}
