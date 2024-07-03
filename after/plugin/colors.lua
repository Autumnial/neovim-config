function Colorise(color)

	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0,"Normal", {bg = "none"})
	vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
    vim.api.nvim_set_hl(0, "@variable", {link = "Identifier"})

end

Colorise()
