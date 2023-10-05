local wilder = require "wilder"

wilder.setup { modes = { ":", "/", "?" } }

wilder.set_option("use_python_remote_plugin", 0)
wilder.set_option("pipeline", {
  wilder.branch(
    wilder.cmdline_pipeline { use_python = 0, fuzzy = 1, fuzzy_filter = wilder.lua_fzy_filter() },
    wilder.vim_search_pipeline(),
    {
      wilder.check(function(_, x)
        return x == ""
      end),
      wilder.history(),
      wilder.result {
        draw = {
          function(_, x)
            return " " .. " " .. x
          end,
        },
      },
    }
  ),
})

local gradient = {
  "#f4468f",
  "#fd4a85",
  "#ff507a",
  "#ff566f",
  "#ff5e63",
  "#ff6658",
  "#ff704e",
  "#ff7a45",
  "#ff843d",
  "#ff9036",
  "#f89b31",
  "#efa72f",
  "#e6b32e",
  "#dcbe30",
  "#d2c934",
  "#c8d43a",
  "#bfde43",
  "#b6e84e",
  "#aff05b",
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
end

local highlighters = {
  wilder.pcre2_highlighter(),
  wilder.lua_fzy_highlighter(),
}

local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
  border = "rounded",
  max_height = "75%", -- max height of the palette
  min_height = 0, -- set to the same as 'max_height' for a fixed height window
  prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
  reverse = 0,
  empty_message = wilder.popupmenu_empty_message_with_spinner(),
  highlights = {
    gradient = gradient, -- must be set
    -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
  },
  highlighter = wilder.highlighter_with_gradient {
    wilder.lua_fzy_highlighter(),
  },
  left = {
    " ",
    wilder.popupmenu_devicons(),
    wilder.popupmenu_buffer_flags {
      flags = " a + ",
      icons = { ["+"] = "", a = "", h = "" },
    },
  },
  right = {
    " ",
    wilder.popupmenu_scrollbar(),
  },
})

wilder.set_option("renderer", popupmenu_renderer)
