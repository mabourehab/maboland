require("starship"):setup()

require("full-border"):setup {
  -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
  type = ui.Border.ROUNDED,
}

require("copy-file-contents"):setup({
  append_char = "\n",
  notification = true,
})

require("eza-preview"):setup({})


Status:children_add(function(self)
  local h = self._current.hovered
  if h and h.link_to then
    return " -> " .. tostring(h.link_to)
  else
    return ""
  end
end, 3300, Status.LEFT)

local home = os.getenv("HOME")
require("bunny"):setup({
  hops = {
    { tag = "home",        path = home,                                 key = "h" },
    { tag = "config",      path = home .. "/.config",                   key = "c" },
    { tag = "local/share", path = home .. "/.local/share",              key = "l" },
    { tag = "downloads",   path = home .. "/Downloads",                 key = "d" },
    { tag = "cases",       path = home .. "/Documents/Work/Case Work/", key = "w" },
    { tag = "mabository",  path = home .. "/Documents/Work/mabository", key = "m" },
  },
  notify = true, -- notify after hopping, default is false
})

require("zoxide"):setup({
  update_db = true
})
