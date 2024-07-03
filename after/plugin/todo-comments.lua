
vim.keymap.set("n", "<leader>tt", "<cmd>TodoTrouble<cr>", { silent = true, noremap = true });
vim.keymap.set("n", "<leader>TT", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true });
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
