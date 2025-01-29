-- Basic configuration:

vim.opt.guifont = "Hack Nerd Font:h16"
vim.opt.number = true          -- Affiche les numéros de ligne
vim.opt.relativenumber = false  -- Affiche les numéros relatifs (utile pour les déplacements)
vim.opt.tabstop = 4            -- Taille d'une tabulation
vim.opt.shiftwidth = 4         -- Taille des indentations automatiques
vim.opt.expandtab = true       -- Convertit les tabulations en espaces
vim.opt.cursorline = true      -- Surligne la ligne courante
vim.opt.wrap = false           -- Désactive le retour à la ligne automatique
vim.opt.scrolloff = 8          -- Laisse un espace en haut et en bas lors du défilement
vim.opt.clipboard = "unnamedplus" -- Partage le presse-papier avec le système
-- Activer le retour à la ligne uniquement pour les fichiers Markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown, text",
    callback = function()
        vim.opt_local.wrap = true         -- Activer le retour à la ligne
        vim.opt_local.linebreak = true    -- Couper les lignes proprement (pas au milieu des mots)
    end
})

-- Lazy setup:

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Plugins: 

require("lazy").setup({
    {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},
    { "nvim-tree/nvim-tree.lua"},
    { "nvim-tree/nvim-web-devicons"},
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    { "neovim/nvim-lspconfig"},
    { "nvim-lualine/lualine.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
    { "hrsh7th/nvim-cmp" },                -- Plugin principal
    { "hrsh7th/cmp-nvim-lsp" },            -- Source pour LSP
    { "hrsh7th/cmp-buffer" },              -- Source pour les buffers ouverts
    { "hrsh7th/cmp-path" },                -- Source pour les chemins de fichiers
    { "saadparwaiz1/cmp_luasnip" },        -- Source pour les snippets
    { "L3MON4D3/LuaSnip" },
    { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
    { "Pocco81/auto-save.nvim"},
    { "windwp/nvim-autopairs" }

})


-- Theme:
vim.cmd.colorscheme("catppuccin-mocha")
require("lualine").setup {
    options = { theme = "catppuccin" }
}

-- Plugins conf
--
-- auto-save
require("auto-save").setup {}
--auto-pair:
require("nvim-autopairs").setup {}

-- terminal
require("toggleterm").setup {
    open_mapping = [[<C-t>]], -- Ouvre le terminal avec Ctrl + t
    direction = "horizontal",      -- Terminal flottant (peut aussi être "horizontal" ou "vertical")
}

--tree conf
require("nvim-tree").setup {
    view = {
        width = 30,               -- Largeur de la fenêtre de l'arbre
        side = "left",            -- Position de l'arbre (left, right)
    },
    renderer = {
        highlight_git = true,     -- Mettre en surbrillance les fichiers suivis par Git
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            }
        }
    },
    git = {
        enable = true,
        ignore = false,
    }
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

--bufferline
require("bufferline").setup {}
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>',  { noremap = true, silent = true })

--telescope conf
require("telescope").setup {}
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- CMP conf

local cmp = require("cmp")

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" }
    }
})


-- LSP conf
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },    -- Utiliser LuaJIT (version de Lua utilisée par Neovim)
            diagnostics = { globals = { "vim" } } -- Ne pas signaler d'erreur pour les variables globales comme `vim`
        }
    }
}

lspconfig.dockerls.setup {}
lspconfig.pyright.setup {}
lspconfig.gopls.setup {}
lspconfig.jsonls.setup{}
