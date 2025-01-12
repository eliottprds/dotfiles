-- Basic configuration:
vim.opt.number = true          -- Affiche les numéros de ligne
vim.opt.relativenumber = false  -- Affiche les numéros relatifs (utile pour les déplacements)
vim.opt.tabstop = 4            -- Taille d'une tabulation
vim.opt.shiftwidth = 4         -- Taille des indentations automatiques
vim.opt.expandtab = true       -- Convertit les tabulations en espaces
vim.opt.cursorline = true      -- Surligne la ligne courante
vim.opt.wrap = false           -- Désactive le retour à la ligne automatique
vim.opt.scrolloff = 8          -- Laisse un espace en haut et en bas lors du défilement
vim.opt.clipboard = "unnamedplus" -- Partage le presse-papier avec le système

-- Lazy setup:

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Plugins: 
require("lazy").setup({
    { "nvim-tree/nvim-tree.lua"},
    { "nvim-tree/nvim-web-devicons"},
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    { "akinsho/toggleterm.nvim", version = "*", config = true},	
    { "neovim/nvim-lspconfig"},
    { "nvim-lualine/lualine.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})




-- Theme:
vim.cmd.colorscheme("catppuccin-mocha")


-- Plugins conf

require("toggleterm").setup {
    open_mapping = [[<C-t>]], -- Ouvre le terminal avec Ctrl + t
    direction = "horizontal",      -- Terminal flottant (peut aussi être "horizontal" ou "vertical")
}
require("lualine").setup {
    options = { theme = "catppuccin" }
}

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

-- LSP conf
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT"},
            diagnostics = { globals = {"vim" } }
        }
    }
}
lspconfig.dockerls.setup {}
lspconfig.pyright.setup {}
lspconfig.gopls.setup {}
lspconfig.jsonls.setup{}
