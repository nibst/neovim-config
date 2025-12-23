local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {

[[ ┌──────────────────────────────────────────────┐ ]],
[[ │                                              │ ]],
[[ │                ,-:;//;:=,                    │ ]],
[[ │            . :H@@@MM@M#H/.,+%;,              │ ]],
[[ │         ,/X+ +M@@M@MM%=,-%HMMM@X/,           │ ]],
[[ │        -+@MM; $M@@MH+-,;XMMMM@MMMM@+-        │ ]],
[[ │       ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.      │ ]],
[[ │     ,%MM@@MH ,@%=            .---=-=:=,.     │ ]],
[[ │     -@#@@@MX .,              -%HX$$%%%+;     │ ]],
[[ │    =-./@M@M$                  .;@MMMM@MM:    │ ]],
[[ │    X@/ -$MM/                    .+MM@@@M$    │ ]],
[[ │   ,@M@H: :@:                    . -X#@@@@-   │ ]],
[[ │   ,@@@MMX, .                    /H- ;@M@M=   │ ]],
[[ │   .H@@@@M@+,                    %MM+..%#$.   │ ]],
[[ │    /MMMM@MMH/.                  XM@MH; -;    │ ]],
[[ │     /%+%$XHH@$=              , .H@@@@MX,     │ ]],
[[ │      .=--------.           -%H.,@@@@@MX,     │ ]],
[[ │      .%MM@@@HHHXX$$$%+- .:$MMX -M@@MM%.      │ ]],
[[ │        =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=        │ ]],
[[ │          =%@M@M#@$-.=$@MM@@@M; %M%=          │ ]],
[[ │            ,:+$+-,/H#MMMMMMM@- -,            │ ]],
[[ │                  =++%%%%+/:-.                │ ]],
[[ │                                              │ ]],
[[ └──────────────────────────────────────────────┘ ]],
[[                       Neovim                     ]],


}
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd $PWD | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "c", "  > Config" , ":e $MYVIMRC | cd %:p:h | Ex | pwd <CR>"),
    dashboard.button( "s", "  > Restore Session", ":lua require('packer').loader('persistence.nvim'); require('persistence').load()<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
