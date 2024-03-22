local header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠊⠑⠞⠁⠀⠈⠓⠀⠖⣒⠁⠀⠀⠀⠋⠒⠢⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡠⢢⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠂⢄⠀⠀⠀⠀⠀⠩⡙
⠀⠀⠀⠀⠀⡠⣁⠔⠁⡠⠊⠀⡌⠀⠀⠀⠄⠀⠀⠀⠀⠐⢄⠑⡄⠀⠀⠀⠀⠘
⠀⠀⠀⠀⣐⢌⠊⣠⡚⠀⢀⣰⢀⠀⠀⠂⠈⣄⠀⠢⡀⡀⠀⠑⠘⢆⣀⠠⠀⠀
⠀⠀⠀⠀⡏⡌⢠⣿⠁⠀⣾⠻⠸⡄⠀⣰⠀⣎⢆⠀⠑⡐⢄⠀⠀⠰⡌⡢⣀⠀
⠀⠀⠀⠀⠇⠇⡘⢸⡄⢸⣇⠀⠆⣇⠀⡿⢆⢹⣮⡢⡀⠸⡄⠑⣄⠀⠹⡟⠺⣠
⠀⠀⠀⠀⠀⠐⠇⠈⠣⣿⡟⢳⡘⡹⣆⢹⡆⠢⣻⣢⣷⣄⣿⣄⢻⠑⢠⣳⡾⣇
⠀⠀⠀⠀⠀⠀⠀⠀⡠⠚⡇⣘⡏⠈⢻⡛⢟⣶⣽⡟⠲⡦⣹⠫⢺⣟⣸⣿⡀⠸
⠀⠀⠀⠀⠀⠀⣔⡝⠀⠀⡇⢀⠤⠀⠀⠁⠀⠈⠱⠅⠀⠝⠙⠀⣎⠇⢇⠌⢿⡄
⠀⠀⠀⠀⠀⢀⠏⡆⡶⡄⠑⣄⠑⣀⣤⠄⠤⡀⠀⠀⠀⠀⠀⢀⠤⣾⠁⠀⠠⠈
⠀⠀⠀⠀⣀⠜⠸⣿⣕⣣⣥⣬⣦⡈⠃⠀⠀⠘⠀⠀⠀⠀⠀⢀⡴⠣⣡⢢⠀⠀
⠀⢀⠤⠊⠁⠀⠀⢀⣿⣿⣿⣿⣿⣿⣦⡀⠤⠜⣀⡠⣴⡿⠞⠋⣴⠾⠓⡧⡳⡄
⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠟⢉⣏⢇⠉⣿⠋⠉⢢⠈⠁⠀⣀⠤⠐⠊⢀⣨⡎
⡠⠀⠀⠀⠀⣀⣴⣿⡿⠋⠀⠀⠈⢹⢾⣠⠋⠳⣄⠸⣆⢠⠎⢀⡤⠖⠚⠉⠁⢱
⣤⣤⣴⣶⣿⣿⠿⠋⠀⠀⠀⠀⠀⠈⢜⡟⠈⠣⡘⣆⠿⢃⡴⠋⠀⣀⠤⠀⢄⠀
]]

-- split by newline
local header_lines = {}
for line in header:gmatch "[^\r\n]+" do
  table.insert(header_lines, line)
end
-- add empty line at the end and beginning
table.insert(header_lines, 1, "")
table.insert(header_lines, "")

require("dashboard").setup {
  theme = "hyper",
  config = {
    header = header_lines,
    week_header = {
      enable = false,
    },
    shortcut = {
      {
        desc = " init.lua",
        group = "Label",
        action = "edit ~/.config/nvim/init.lua",
        key = "e",
      },
      {
        desc = " Files",
        group = "String",
        action = "Telescope find_files",
        key = "f",
      },
      {
        desc = " Projects",
        group = "Statement",
        action = "Telescope projects",
        key = "p",
      },
      {
        desc = "󰆘 Sessions",
        group = "Number",
        action = "Telescope persisted",
        key = "s",
      },
    },
    project = {
      limit = 5,
    },
    mru = {
      limit = 5,
    },
    footer = { "", "一个人的命运啊，当然要靠自我奋斗，但是也要考虑到历史的行程。" },
  },
}
