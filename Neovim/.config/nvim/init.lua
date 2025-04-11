-- Global VIM variables for Tab spacing, number gutter and concealer
vim.o.number = true
vim.o.conceallevel = 2
vim.o.concealcursor = "nvc"
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.linebreak = true
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.g.markdown_recommended_style = 0

-- Global keybinds for easier VIM usage
--- Leader mapping to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--- Keybinds for controlling the number gutter
vim.keymap.set("n", "<C-n>", ":set nu! | IBLToggle<CR>")
vim.keymap.set("n", "<leader>n", ":set rnu!<CR>")

--- Keybinds for End and Home to be similar to bash
vim.keymap.set({ "n", "i" }, "<C-e>", "<End>")
vim.keymap.set({ "n", "i" }, "<C-a>", "<Home>")

--- Keybinds for a better Tab button experience
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("i", "<S-Tab>", "<C-d>")
---
--- Keybinds for easier changing between buffers
vim.keymap.set("n", "<leader>]", ":bn<CR>")
vim.keymap.set("n", "<leader>[", ":bp<CR>")
vim.keymap.set("n", "<leader>w", ":BufferClose<CR>")
vim.keymap.set("n", "<leader><Tab>", ":bn<CR>")

--- Keybinds for quick deleting inline similar to bash
vim.keymap.set("i", "<C-u>", "<ESC>d^i")
vim.keymap.set("i", "<C-k>", "<ESC>d$i")
vim.keymap.set("n", "<C-u>", "d^")
vim.keymap.set("n", "<C-k>", "d$")

--- Keybinds for quick remove of search highlights
vim.keymap.set("n", "<C-h>", ":noh<CR>")
vim.keymap.set("i", "<C-h>", "<C-o>:noh<CR>")

--- Keybinds for clearing the screen similar to bash
vim.keymap.set("n", "<C-l>", "zt")
vim.keymap.set("i", "<C-l>", "<ESC>zta")

--- Keybinds for easier markdown **syntaxing
vim.keymap.set("i", "<C-b>", "****<left><left>", { desc = "Bold syntax" })
vim.keymap.set("n", "<C-b>", "ebi**<ESC>e<right>i**<ESC>", { desc = "Bold existing word" })
vim.keymap.set("i", "<M-b>", "____<left><left>", { desc = "Italic syntax" })
vim.keymap.set("i", "<C-c>", "```bash<CR><CR>```<up>", { desc = "Bash code block" })

--- Keybinds for Window Splitting
vim.keymap.set("n", "<leader>s", ":vsplit<CR><C-w>w", { desc = "Vertical Split" })
vim.keymap.set("n", "<leader>h", ":split<CR><C-w>w", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader><right>", "<C-w><right>", { desc = "Change to Right Window" })
vim.keymap.set("n", "<leader><left>", "<C-w><left>", { desc = "Change to Left Window" })
vim.keymap.set("n", "<leader><up>", "<C-w><up>", { desc = "Change to Above Window" })
vim.keymap.set("n", "<leader><down>", "<C-w><down>", { desc = "Change to Below Window" })

--- Keybinds for Closing with Neotree
vim.keymap.set("n", "ZZ", ":Neotree close<CR>:wq<CR>", { desc = "Save & Quit and close Neotree" })
vim.keymap.set("n", "ZQ", ":Neotree close<CR>:q!<CR>", { desc = "Quit and close Neotree" })

-- Keybinds for Clipboard in Visual Mode
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to Clipboard" })

-- Keybinds for easier navigating between spelling errors
vim.keymap.set("n", "<leader>f[", "[s", { desc = "Move to next spelling error" })
vim.keymap.set("n", "<leader>f]", "]s", { desc = "Move to next spelling error" })
vim.keymap.set("n", "<leader>fsg", "zg", { desc = "Add word to dictionary" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Plugins are imported from ~/.config/nvim/lua/plugins/
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin-macchiato" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})


local group = vim.api.nvim_create_augroup('autosave', {})

vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveWritePost',
  group = group,
  callback = function(opts)
    if opts.data.saved_buffer ~= nil then
      local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
      vim.notify('Autosaved' .. ' at ' .. vim.fn.strftime('%H:%M:%S'), vim.log.levels.INFO)
    end
  end,
})
