vim.cmd [[
set termguicolors
try
  colorscheme solarized8_high
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

" If you need to adjust the modal popup background color
"highlight Pmenu ctermbg=blue guibg=blue
  
set background=light
]]
