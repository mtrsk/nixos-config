require'nvim-tree'.setup()

-- Maps
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<Leader>t', ':NvimTreeToggle<CR>', options)
map('n', '<Leader>k', ':NvimTreeClose<CR>', options)
map('n', '<Leader>f', ':NvimTreeFocus<CR>', options)

-- Package options
local g = vim.g
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}

-- Integration with tabs
local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree
