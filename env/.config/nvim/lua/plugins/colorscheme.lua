return {
  -- add gruvbox
  { "rose-pine/neovim", as = "rose-pine" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
