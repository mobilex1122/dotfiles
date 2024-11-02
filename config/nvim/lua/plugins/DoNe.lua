return {
  "monkoose/DoNe",
  lazy = true,
  -- optional configuration
  config = function()
    -- as example adding some keybindings
    vim.keymap.set("n", "<F5>", "<Cmd>DoNe build<CR>")

    ---vim.cmd.LspConfig()
    --- ...
    local restartOnce = false
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function()
        if not restartOnce then
          restartOnce = true
          vim.cmd("LspRestart") -- This will issue the :LspRestart command
        end
      end,
    })
  end,
}
