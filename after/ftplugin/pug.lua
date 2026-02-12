-- Cấu hình này chỉ chạy khi mở file .pug
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true
vim.opt_local.commentstring = "//- %s"

-- Phím tắt ví dụ
vim.keymap.set("n", "<leader>cp", ":!pug < % <CR>", { buffer = true, silent = true })
