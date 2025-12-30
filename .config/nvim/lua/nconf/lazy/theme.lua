return {
  "folke/tokyonight.nvim",
  lazy = false,    -- Tema harus dimuat saat startup
  priority = 1000, -- Prioritas tinggi agar tidak "flicker" saat ganti tema
  config = function()
    require("tokyonight").setup({
      -- Pilihan gaya: "storm", "moon", "night", atau "day"
      style = "moon", 
      transparent = true,    -- Set ke true jika ingin background terminal tembus pandang
      terminal_colors = true, 
      styles = {
        sidebars = "dark",   -- Gaya untuk panel samping (seperti nvim-tree)
        floats = "dark",     -- Gaya untuk jendela floating
      },
    })

    -- Mengaktifkan tema
    vim.cmd([[colorscheme tokyonight]])
  end,
}
