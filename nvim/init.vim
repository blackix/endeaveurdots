set number
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lualine/lualine.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-commentary'

call plug#end()
lua << EOF
require('lualine').setup {
  options = {
    theme = 'base16',
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    icons_enabled = true,
  }
}
EOF
lua << EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      -- Configura qui il tuo snippet engine preferito
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-1),
    ['<C-f>'] = cmp.mapping.scroll_docs(1),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accetta la selezione con ENTER
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})
EOF

