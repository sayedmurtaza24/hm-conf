return {
  "chrisgrieser/nvim-various-textobjs",
  keys = {
    { "u",  '<cmd>lua require("various-textobjs").url()<CR>',             mode = { "o", "x" } },

    { "as", '<cmd>lua require("various-textobjs").subword("outer")<CR>',  mode = { "o", "x" } },
    { "is", '<cmd>lua require("various-textobjs").subword("inner")<CR>',  mode = { "o", "x" } },

    { "aq", '<cmd>lua require("various-textobjs").anyQuote("outer")<CR>', mode = { "o", "x" } },
    { "iq", '<cmd>lua require("various-textobjs").anyQuote("inner")<CR>', mode = { "o", "x" } },
  },
}
