require("lualine").setup {
    options = {
        theme = "auto",
        -- ... lualine config
    },
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            }
        }
    },
}
