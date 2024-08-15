require("lualine").setup({
  options = {
    theme = "codedark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_c = { "%F", "%m" },
    lualine_x = { "%(%{repeat(printf(\"%s\",!&iminsert?\"en\":get(b:,\"keymap_name\",\"en\")),mode()==#\"i\")}%)", "fileformat", "filetype" },
    lualine_y = { "%v" },
    lualine_z = { "%l/%L" }
  },
})
