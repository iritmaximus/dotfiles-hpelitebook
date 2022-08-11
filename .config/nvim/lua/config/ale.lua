local ale = require("ale")
local g = vim.g

ale.setup({
  vim.cmd([[
    let g:ale_fixers = {
      \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
      \ 'typescript': [ 'eslint', 'prettier' ],
      \ 'typescriptreact': [ 'eslint', 'prettier' ],
      \ 'javascript': [ 'eslint', 'prettier' ],
      \ 'javascriptreact': [ 'eslint', 'prettier' ]
    }
    let g:ale_echo_msg_error_str = "E"
    let g:ale_echo_msg_warning_str = "W"
    let g:ale_echo_msg_info_str = "I"
    let g:ale.echo_msg_format = "[%linter%] %s [%severity%]"
  ]])
})
