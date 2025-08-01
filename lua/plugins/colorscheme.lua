return {
  { -- rosepine
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = { comments = {italic = false}}
  },
  {
    "huyvohcmc/atlas.vim",
    priority = 1000
  } ,
  {
    "aditya-azad/candle-grey", 
    priority = 1000
  } ,
}
