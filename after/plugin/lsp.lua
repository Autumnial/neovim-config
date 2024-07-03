local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
    'rust_analyzer',
    'eslint',
    'tsserver',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping.abort()
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil



lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opt = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opt)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opt)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opt)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opt)

    vim.keymap.set("n", "<leader>fb", function() vim.lsp.buf.format() end, opt)

    vim.diagnostic.config({
        virtual_text = {
            -- source = "always",  -- Or "if_many"
            prefix = '■',
        },
        severity_sort = true
    })
end)

lsp.setup()
