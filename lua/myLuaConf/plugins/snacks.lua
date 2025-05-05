return {
  "snacks.nvim",
  for_cat = {
    cat = "eyecandy",
    default = true,
  },
  priority = 1000,
  lazy = false,
  after = function(plugin)
        require("snacks").setup{
          dashboard = {
            enabled = true,
            -- We don't want lazy as a function
            keys = {
              { icon = " ", key = "f", desc = "Find File",
                action = ":lua Snacks.dashboard.pick('files')" },
              { icon = " ", key = "n", desc = "New File",
                action = ":ene | startinsert" },
              { icon = " ", key = "g", desc = "Find Text",
                action = ":lua Snacks.dashboard.pick('live_grep')" },
              { icon = " ", key = "r", desc = "Recent Files",
                action = ":lua Snacks.dashboard.pick('oldfiles')" },
              { icon = " ", key = "s", desc = "Restore Session",
                section = "session" },
              { icon = " ", key = "q", desc = "Quit",
                action = ":qa" },
            },
            preset = {
              header = [[
   ▄████▄   ▄▄▄     ▄▄▄█████▓▒███████▒
  ▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒▒ ▒ ▒ ▄▀░
  ▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░░ ▒ ▄▀▒░ 
  ▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░   ▄▀▒   ░
  ▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░ ▒███████▒
  ░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░   ░▒▒ ▓░▒░▒
    ░  ▒     ▒   ▒▒ ░   ░    ░░▒ ▒ ░ ▒
  ░          ░   ▒    ░      ░ ░ ░ ░ ░
  ░ ░            ░  ░          ░ ░    
]],
            },
            -- Using the advanced template
            sections = {
              { section = "header" },
             { section = "keys", gap = 1, padding = 0 },
              { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
              { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
              {
                pane = 2,
                icon = " ",
                title = "Git Status",
                section = "terminal",
                enabled = function()
                  return require('snacks').git.get_root() ~= nil
                end,
                cmd = "git status --short --branch --renames",
                height = 5,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
              },
              -- This needs lazy, replace this with my own plugin?
              --{ section = "startup" },
            },
          },
        }
  end
}
