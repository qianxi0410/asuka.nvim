local G = {}
local os_name = vim.loop.os_uname().sysname

function G:init()
  self.is_mac = os_name == "Darwin"
  self.is_linux = os_name == "Linux"
  self.is_windows = os_name == "Windows"
  self.is_wsl = self.is_windows and os.getenv "WSL_DISTRO_NAME"

  self.vim_path = vim.fn.stdpath "config"
  local path_sep = self.is_windows and "\\" or "/"
  local home = self.is_windows and os.getenv "USERPROFILE" or os.getenv "HOME"
  self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
  self.home = home
  self.data_dir = vim.fn.stdpath "data"
end

G:init()

return G
