if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd
vim.api.nvim_command([[
  augroup Ruby
    autocmd FileType ruby abbreviate <buffer> pry require 'pry'; binding.pry
    autocmd BufNewFile,BufRead *.json.jbuilder set ft=ruby
  augroup END
]])

require("config.lazy")
