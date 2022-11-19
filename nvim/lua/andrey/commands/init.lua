-- Access Main Config file
vim.api.nvim_create_user_command('Config', 'edit $MYVIMRC', { nargs = 0 })
vim.api.nvim_create_user_command('ConfigFolder', 'edit ~/.config/nvim/lua/andrey', { nargs = 0 })

-- Reload Lua Config, including andrey.* includes
vim.api.nvim_create_user_command('ConfigReload', require('andrey.commands.reload'), { nargs = 0 })
