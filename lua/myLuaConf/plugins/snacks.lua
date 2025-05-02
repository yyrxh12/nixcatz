return {
  "snacks-nvim",
  for_cat = {
    cat = "eyecandy",
    default = true,
  },
  priority = 1000,
  lazy = false,
  after = function(plugin)
        require("snacks-nvim").setup{
          dashboard = {
            enabled = true
          },
        }
  end
}
