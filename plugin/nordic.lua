-- Git managed

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add({ GH("AlexvZyl/nordic.nvim") })
---@diagnostic disable-next-line: missing-fields
vim.cmd.colorscheme("nordic")
