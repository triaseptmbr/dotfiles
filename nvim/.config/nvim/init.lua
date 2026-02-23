local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('Mofiqul/dracula.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'master', ['do'] = ':TSUpdate'})
Plug('tpope/vim-surround')

vim.call('plug#end')

vim.cmd('colorscheme dracula')
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = true

local function set_tab_width(width)
    vim.opt_local.tabstop = width
    vim.opt_local.shiftwidth = width
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'html', 'css' },
    callback = function()
        set_tab_width(2)
    end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
    command = 'checktime',
})

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require("nvim-tree").setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { desc = 'Focus NvimTree' })
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { desc = 'Find current file in NvimTree' })
vim.keymap.set('n', '<leader>c', ':NvimTreeCollapse<CR>', { desc = 'Collapse NvimTree' })
