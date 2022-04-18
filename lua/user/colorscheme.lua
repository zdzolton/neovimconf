vim.cmd [[
    set termguicolors
    try
      colorscheme solarized8_high
    catch /^Vim\%((\a\+)\)\=:E185/
      colorscheme default
    endtry

    set background=light
]]

vim.cmd [[
    " If you need to adjust the modal popup background color
    "highlight Pmenu ctermbg=blue guibg=blue

    " Make floating diagnostic hints readable with my light solarized theme...
    highlight DiagnosticHint ctermfg=7 guifg=grey
]]
