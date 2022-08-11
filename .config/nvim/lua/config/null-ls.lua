-- UNUSED because of ale and this sucks lol didnt get it to work
local nullls = require("null-ls")

nullls.setup({
  sources = {
    nullls.builtins.code_actions.eslint_d

    -- nullls.builtins.diagnostics.actionlint
    nullls.builtins.diagnostics.eslint_d
    -- nullls.builtins.diagnostics.jsonlint
    -- nullls.builtins.diagnostics.luacheck
    -- nullls.builtins.diagnostics.tsc.with({
    --   filetypes = { "typescript", "typescriptreact" }
    -- }),

    -- nullls.builtins.formatting.eslint_d
    -- nullls.builtins.formatting.lua_format
    nullls.builtins.formatting.prettier
  },

  diagnostic_format = "[#{s}] #{m} [#{c}]"

})
