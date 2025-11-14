-- tab --
-- vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- split --
vim.opt.splitbelow = true               -- focus new window
vim.opt.splitright = true               -- focus new window

-- wrapping --
vim.opt.wrap = true                     -- wrap text
vim.opt.breakindent = true              -- indent wrapped lines

-- indentation --
vim.opt.autoindent = true               -- copies indentation of prev line when appropriate
vim.opt.smartindent = true              -- auto indent when appropriate
-- vim.opt.list = true                     -- disable with nolist
-- vim.opt.lcs:append "space:."            -- show whitespace as .

-- search --
vim.opt.hlsearch = true                 -- highlight all search matches
vim.opt.incsearch = true                -- highlight while searching
vim.opt.ignorecase = true
vim.opt.smartcase = true                -- only match cases when cases are used
vim.opt.iskeyword=vim.opt.iskeyword-"_" -- underscores work like spaces when jumping words

-- ui --
vim.opt.showmode        = false          -- disable line number visibility in visual mode
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.signcolumn      = "yes"
vim.opt.cmdheight       = 2

-- latex to unicode using julia plugin --
vim.g.latex_to_unicode_file_types = ".*"
vim.g.latex_to_unicode_auto = 1

-- colours
vim.opt.termguicolors = true
colourss = 'light'
if colourss == 'dark' then
    vim.g.accent_no_bg = true
    vim.g.accent_invert_status = false
    vim.cmd.colorscheme("accent")            -- color scheme
    -- lol manually changing stuff to be shades of grey instead of white
    -- tbh i should just make a colour scheme. i prob will :)

    vim.opt.background  = "dark"
    vim.g.accent_darken = true
    vim.cmd.highlight('Type ctermfg=250 guifg=#bcbcbc')
    vim.cmd.highlight('Special ctermfg=250 guifg=#999999')
    vim.cmd.highlight('String ctermfg=250 guifg=#cccccc')
    vim.cmd.highlight('Normal ctermfg=253 guifg=#dadada')
    vim.cmd.highlight('StatusLine ctermbg=NONE guibg=NONE')
elseif colourss == 'light' then
    vim.opt.background  = "light"
    vim.cmd.colorscheme "e-ink"
end
for i = 0,15 do
    vim.g[('terminal_color_%d'):format(i)] = 'NONE'
end

-- misc --
vim.opt.mouse = ""                      -- disable mouse
vim.opt.title = true                    -- window title as file names and/or paths
vim.opt.clipboard:append "unnamedplus"  -- always use the clipboard
vim.opt.scrolloff = 8                   -- 8 screen line space buffer
vim.cmd.filetype("plugin on")           -- enable filetype plugins

vim.g.zig_fmt_autosave = false          -- zls is dumb

vim.opt.guicursor = "n-v-i-c:block-Cursor" -- always block cursor

-- cornelis --
vim.g.cornelis_use_global_binary = 1

-- vimtex --
vim.g.vimtex_view_method        = 'zathura'
vim.g.vimtex_compiler_method    = 'latexrun'

-- auto commands --
vim.api.nvim_create_autocmd("VimEnter", { callback = function() vim.cmd.highlight("clear SignColumn") end, })                          -- clear gutter colours
vim.api.nvim_create_autocmd({ "BufWritePre" }, { -- remove trailing whitespace
    callback = function()
        save_cursor = vim.fn.getpos(".")         -- TODO: maybe use winsaveview()? or markers
        vim.cmd([[%s/\s\+$//e]])
        vim.cmd([[%s/\n\+\%$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
