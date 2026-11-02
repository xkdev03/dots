vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.opt.winborder = "rounded"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>cd', ':Explore<CR>')

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
})

vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client:supports_method('textDocument/completion') then
						vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
				end
		end,
})

require "mini.pick".setup()

vim.keymap.set('n', '<leader>f', ":Pick files<CR>") 
vim.keymap.set('n', '<leader>h', ":Pick help<CR>") 

vim.lsp.enable({ "lua_ls", "pyright", "clangd", "rust-analyzer" })

vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")
