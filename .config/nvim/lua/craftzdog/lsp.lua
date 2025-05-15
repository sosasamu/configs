local M = {}

function M.toggleInlayHints()
	vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end

function M.inlineError()
	vim.diagnostic.open_float()
end

return M
