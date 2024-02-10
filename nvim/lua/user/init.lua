return {
  colorscheme = "monokai-pro",
  lsp = {
    servers = {
      "lime_lsp",
    },
    config = {
      lime_lsp = function()
        return {
          cmd = {'haxe-language-server'},
          filetypes = {"haxe"},
          settings = {
            haxe = {
              executable = "haxe"
            }
          },
          init_options = {
            displayArguments = {"export/hl/haxe/debug.hxml"},
          },
          root_dir = require("lspconfig.util").root_pattern("export/hl/haxe/debug.hxml");
        }
      end,
    }
  }
}
