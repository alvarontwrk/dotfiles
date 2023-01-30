function ColorMyPencils(color)
    -- color = color or "onedark-darker"
    -- vim.cmd.colorscheme(color)

    require('onedark').setup {
        style = 'darker'
    }
    require('onedark').load()

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
end

ColorMyPencils()

vim.cmd.AirlineTheme("papercolor")
