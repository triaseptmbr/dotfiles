require("config.lazy")

vim.cmd.colorscheme('onedark')
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = true

local function set_tab_width(width)
    vim.opt_local.tabstop = width
    vim.opt_local.shiftwidth = width
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascript', 'html', 'css' },
    callback = function()
        set_tab_width(2)
    end,
})

vim.o.autoread = true
    vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
        command = "checktime",
})

require('lualine').setup()
