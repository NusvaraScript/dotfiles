local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
        require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept suggestion
        ['<Tab>'] = cmp.mapping.select_next_item(),
                                        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    })
})
