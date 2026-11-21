-- To choose a glyph: https://www.nerdfonts.com/cheat-sheet
-- 1. Search for an icon (for example, "bash" or "terminal").
-- 2. Hover over or click the icon to reveal COPY: Icon / Class / UTF.
-- 3. Click "Icon" to copy the glyph character, then paste it into glyph = "...".
-- 4. Restart Neovim to apply the change.
--
-- Customize icons under opts using these exact keys:
-- extension: extension without the dot, e.g. sh = { glyph = "", hl = "MiniIconsCyan" }
-- file: exact filename, e.g. ["package.json"] = { glyph = "", hl = "MiniIconsGreen" }
-- filetype: Neovim filetype, e.g. sh = { glyph = "", hl = "MiniIconsGreen" }
-- Check the current buffer's filetype with :set filetype?
-- For file lookups, an explicit filename override wins over an extension override;
-- filetype detection is a fallback. Plugins requesting a filetype use filetype overrides.
--
-- Icon colors (hl): MiniIconsAzure, MiniIconsBlue, MiniIconsCyan,
-- MiniIconsGreen, MiniIconsGrey, MiniIconsOrange, MiniIconsPurple,
-- MiniIconsRed, MiniIconsYellow. Exact shades depend on the colorscheme.
-- Any existing highlight group also works, such as "Comment" or "DiagnosticWarn".
-- Preview a group with :highlight MiniIconsGreen
return {
  {
    "echasnovski/mini.icons",
    opts = {
      extension = {
        sh = { glyph = "", hl = "MiniIconsGrey" },
        zsh = { glyph = "", hl = "MiniIconsGrey" },
      },
      file = {},
      filetype = {
        sh = { glyph = "", hl = "MiniIconsGrey" },
        zsh = { glyph = "", hl = "MiniIconsGrey" },
      },
    },
  },
}
