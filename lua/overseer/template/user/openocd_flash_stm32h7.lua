return {
  name = "Flash STM32H7",
  builder = function()
    -- 注意：这里的路径是相对于 Neovim 的工作目录 (通常是项目根目录)
    -- 确保 interface/, target/ 和 build/STM32H743IIT6.elf 路径正确
    local elf_path = "./build/STM32H743IIT6.elf" -- 相对于项目根目录
    local interface_cfg = "interface/cmsis-dap.cfg" -- 相对于项目根目录
    local target_cfg = "target/stm32h7x.cfg" -- 相对于项目根目录

    return {
      cmd = { "openocd" },
      args = {
        "-f",
        interface_cfg,
        "-f",
        target_cfg,
        "-c",
        string.format("program %s verify reset exit", elf_path), -- 将命令作为一个参数传递
      },
      -- 解析输出并在 quickfix 窗口中显示错误/警告，但不自动打开 quickfix
      components = { { "on_output_quickfix", open = false }, "default" },
    }
  end,
  condition = {
    -- 仅在 C 或 C++ 文件类型时建议此任务
    -- filetype = { "c", "cpp" },
    -- 可以添加条件，例如检查 elf 文件是否存在
    -- file_exists = { "./build/STM32H743IIT6.elf" },
  },
}
