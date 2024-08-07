-- Languages
vim.o.completeopt = "menu,menuone,noselect"

-----------------------
-- Language Servers ---

-- Set tab to accept the autocompletion
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})

-- Setup
--local on_attach = require("plugins.configs.lspconfig").on_attach
--local capabilities = require("plugins.configs.lspconfig").capabilities
--
--local lspconfig = require "lspconfig"
--local util = require "lspconfig/util"
require "lspconfig"
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Elixir
-- Every Elixir devenv needs to have this envar defined
local elixir_ls_path = os.getenv("ELIXIR_LS_PATH")
require 'lspconfig'.elixirls.setup {
    cmd = { elixir_ls_path },
    filetypes = { "elixir", "eelixir", "heex", "surface" },
    capabilities = capabilities,
    -- root_dir = root_pattern("mix.exs", ".git") or vim.loop.os_homedir(),
}

-- Erlang
require 'lspconfig'.erlangls.setup{
    capabilities = capabilities,
}

-- F#
require("ionide").setup {
    autostart = true,
    --on_attach = on_attach,
    capabilities = capabilities,
}

-- https://github.com/ionide/Ionide-vim?tab=readme-ov-file#settings
vim.g["fsharp#lsp_auto_setup"] = 1
vim.g["fsharp#lsp_recommended_colorscheme"] = 1
vim.g["fsharp#automatic_workspace_init"] = 1
vim.g["fsharp#linter"] = 1
vim.g["fsharp#unused_opens_analyzer"] = 1
vim.g["fsharp#unused_declarations_analyzer"] = 1
vim.g["fsharp#show_signature_on_cursor_move"] = 1
vim.g["fsharp#fsi_focus_on_send"] = 1

-- custom mapping
vim.g["fsharp#fsi_keymap"] = "custom"
vim.g["fsharp#fsi_keymap_send"] = "<leader>-i"
vim.g["fsharp#fsi_keymap_toggle"] = "<leader>-@"

-- Nix
require'lspconfig'.nil_ls.setup{}

-- Terraform
require'lspconfig'.terraformls.setup{}
vim.g.terraform_fmt_on_save = 1
vim.g.terraform_align = 1

-- Lua
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-----------------------
-- Autocompletion setup
local cmp = require'cmp'

cmp.setup({
snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
    require('luasnip').lsp_expand(args.body)
    end,
},
window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'treesitter' }
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['nil_ls'].setup {
    capabilities = capabilities
}

require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
}

