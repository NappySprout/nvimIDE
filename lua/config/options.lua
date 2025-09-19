local indentspace = 4

vim.o.tabstop = indentspace
vim.o.shiftwidth = indentspace
vim.o.expandtab = true

vim.keymap.set('n', '<c-l>', '<c-w>l')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-h>', '<c-w>h')

vim.o.number = true
vim.o.relativenumber = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10
vim.o.confirm = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.cmd("colorscheme kanagawa-wave")
vim.keymap.set('n', 'L', '<cmd>bn<CR>')
vim.keymap.set('n', 'H', '<cmd>bN<CR>')
vim.keymap.set('n', ' bd', ':bp<bar>sp<bar>bn<bar>bd<CR>')
vim.keymap.set('n', ' bo', function()
  local cur = vim.api.nvim_get_current_buf()
  local buffs = vim.api.nvim_list_bufs()
  for i = 1, #buffs do
    local buff =  buffs[i]
    if buff ~= cur then
      vim.api.nvim_buf_delete(buff, {})
    end
  end
end)
