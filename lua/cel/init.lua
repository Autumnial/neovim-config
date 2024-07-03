require("cel.set")
require("cel.remap")
vim.o.background = "dark" -- or "light" for light mode


vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set("n", "<leader>et", "<cmd>TroubleToggle<cr>" , {silent = true, noremap = true});
vim.keymap.set("n", "<leader>ew", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true});
vim.keymap.set("n", "<leader>ed", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true});
vim.keymap.set("n", "<C-h>", vim.cmd.bnext)
vim.keymap.set("n", "<C-l>", vim.cmd.bprevious)

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern ="*.wgsl",
    callback = function ()
        vim.bo.filetype = "wgsl"
    end
})


local lspconfig = require('lspconfig')

lspconfig.wgsl_analyzer.setup()


