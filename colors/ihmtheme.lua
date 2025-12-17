vim.cmd("highlight clear")
vim.o.termguicolors = true
vim.g.colors_name = "ihmtheme"

local c = {
  bg        = "#282A36",
  fg        = "#F8F8F2",
  selection = "#44475A",
  comment   = "#6272A4",
  red       = "#FF5555",
  orange   = "#FFB86C",
  yellow   = "#F1FA8C",
  green    = "#50FA7B",
  cyan     = "#8BE9FD",
  blue     = "#BD93F9",
  purple   = "#FF79C6",
}

local hl = vim.api.nvim_set_hl

--------------------------------------------------
-- Editor / UI
--------------------------------------------------
hl(0, "Normal",       { fg = c.fg, bg = c.bg })
hl(0, "CursorLine",   { bg = c.selection })
hl(0, "Visual",       { bg = c.selection })
hl(0, "LineNr",       { fg = c.comment })
hl(0, "CursorLineNr", { fg = c.yellow, bold = true })

-- Split / window separators (NVChad style)
hl(0, "VertSplit",    { fg = c.selection })
hl(0, "WinSeparator", { fg = c.selection })

--------------------------------------------------
-- Classic syntax
--------------------------------------------------
hl(0, "Comment",    { fg = c.comment, italic = true })
hl(0, "String",     { fg = c.yellow })
hl(0, "Function",   { fg = c.green })
hl(0, "Keyword",    { fg = c.purple })
hl(0, "Identifier", { fg = c.cyan })
hl(0, "Type",       { fg = c.blue })
hl(0, "Constant",   { fg = c.orange })
hl(0, "PreProc",    { fg = c.purple }) -- fallback

--------------------------------------------------
-- Treesitter (MODERN – ASIL FARK BURADA)
--------------------------------------------------
hl(0, "@variable",           { fg = c.fg })
hl(0, "@variable.builtin",   { fg = c.purple })

hl(0, "@function",           { fg = c.green })
hl(0, "@function.builtin",   { fg = c.cyan })
hl(0, "@function.call",      { fg = c.green })

hl(0, "@keyword",            { fg = c.purple })
hl(0, "@keyword.return",     { fg = c.purple })
hl(0, "@keyword.operator",   { fg = c.purple })

hl(0, "@type",               { fg = c.blue })
hl(0, "@type.builtin",       { fg = c.blue })

hl(0, "@string",             { fg = c.yellow })
hl(0, "@string.escape",      { fg = c.orange })

hl(0, "@constant",            { fg = c.orange })
hl(0, "@constant.builtin",    { fg = c.orange })
hl(0, "@constant.macro",      { fg = c.purple })

-- C / C++ preprocessor (EN KRİTİK KISIM)
hl(0, "@preproc", { fg = c.purple })
hl(0, "@include", { fg = c.purple })
hl(0, "@define",  { fg = c.purple })

--------------------------------------------------
-- Diagnostics
--------------------------------------------------
hl(0, "DiagnosticError", { fg = c.red })
hl(0, "DiagnosticWarn",  { fg = c.orange })
hl(0, "DiagnosticInfo",  { fg = c.cyan })
hl(0, "DiagnosticHint",  { fg = c.green })

-- Keyword fallbacks (NVChad style)
hl(0, "@statement",        { fg = c.purple })
hl(0, "@keyword.control",  { fg = c.purple })

-- Legacy highlight fallback (hala kullanılıyor)
hl(0, "Statement", { fg = c.purple })

--------------------------------------------------
-- Telescope
--------------------------------------------------
hl(0, "TelescopeNormal",    { fg = c.fg, bg = c.bg })
hl(0, "TelescopeBorder",    { fg = c.selection })
hl(0, "TelescopeSelection", { bg = c.selection })
hl(0, "TelescopeMatching",  { fg = c.green })

-- Classic fallback
hl(0, "Statement", { fg = c.purple })

-- Treesitter fallbacks
hl(0, "@statement",       { fg = c.purple })
hl(0, "@keyword.control", { fg = c.purple })
