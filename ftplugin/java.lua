local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = 'C:\\Users\\cel\\.cache\\jdtls_workspace' .. project_name

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-noverify',
        '-Xmx1G',
        --add-modules=ALL-SYSTEM \
        --add-opens java.base/java.util=ALL-UNNAMED \
        --add-opens java.base/java.lang=ALL-UNNAMED \
        '-jar', 'C:\\dev\\java\\lsp\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', 'C:\\dev\\java\\lsp\\config_win\\',
        '-data', workspace_dir,
    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    capabilities = capabilities,
    settings = {
        java = {
            project = {
                referencedLibraries = {
                    'C:\\Program Files\\Java\\libs\\saxionapp.jar'
                }
            }
        }
    }
}
require('jdtls').start_or_attach(config)


local opt = { buffer = bufnr, remap = false }

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opt)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opt)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opt)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opt)
vim.keymap.set("n", "<leader>io", function() require('jdtls').organize_imports() end, opt)
vim.keymap.set("n", "<leader>fb", function() vim.lsp.buf.format() end, opt)
vim.diagnostic.config({
    virtual_text = {
        -- source = "always",  -- Or "if_many"
        prefix = '■',
    },
    severity_sort = true
})
