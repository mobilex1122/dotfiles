return {
  n = {
    ["<leader>ac"] = {function() return vim.fn["codeium#Chat"]() end,
      desc="Open chat window", expr=true
    },
    ["<leader>ae"] = { "<cmd>Codeium Enable<cr>",desc="Enable codeium"},
    ["<leader>ad"] = { "<cmd>Codeium Disable<cr>",desc="Disable codeium"},
    ["<leader>a"] = { name = "Codeium" }
  }
}
