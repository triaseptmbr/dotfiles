local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('olimorris/onedarkpro.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'master', ['do'] = ':TSUpdate'})

vim.call('plug#end')

vim.cmd('colorscheme onedark')
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

local function set_tab_width(width)
    vim.opt_local.tabstop = width
    vim.opt_local.shiftwidth = width
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html", "css"},
    callback = function()
        set_tab_width(2)
    end,
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = {
                width = 180
            },
            preview_width = 0.3
        },
    },
})

require('lualine').setup()

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
