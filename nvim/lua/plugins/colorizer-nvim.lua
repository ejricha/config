return {
  --- Makes colors of names show on the terminal. ex #aaaaaa
  "norcalli/nvim-colorizer.lua",
  enabled = vim.g.enabled_plugins,
  config = function()
    require("colorizer").setup(
      { "*" },           -- This will enable colorizer for all file types
      {
        RGB = false,     -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes with alpha channel
        rgb_fn = false,  -- CSS rgb() and rgba() functions
        hsl_fn = false,  -- CSS hsl() and hsla() functions
        css = false,     -- Enable all CSS features (rgb_fn, hsl_fn)
        css_fn = false,  -- Enable all CSS *functions* (rgb_fn, hsl_fn)
      }
    )
  end,
}
