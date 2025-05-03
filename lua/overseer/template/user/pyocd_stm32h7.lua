return {
  name = "Flash STM32H7 pyocd",
  builder = function()
    -- 注意：这里的路径是相对于 Neovim 的工作目录 (通常是项目根目录)
    -- 确保 interface/, target/ 和 build/STM32H743IIT6.elf 路径正确
    local elf_path = "./build/STM32H743IIT6.elf" -- 相对于项目根目录
    local target = "stm32h743iitx" -- 相对于项目根目录

    return {
      cmd = { "pyocd" },
      args = {
        "flash",
        "-t",
        target,
        "--erase",
        "chip",
        elf_path,
      },
      -- 解析输出并在 quickfix 窗口中显示错误/警告，但不自动打开 quickfix
      components = { { "on_output_quickfix", open = false }, "default" },
    }
  end,
  condition = {
    -- 仅在 C 或 C++ 文件类型时建议此任务
    -- filetype = { "c", "cpp" },
    -- 可以添加条件，例如检查 elf 文件是否存在
    file_exists = { "./build/STM32H743IIT6.elf" },
  },
}
