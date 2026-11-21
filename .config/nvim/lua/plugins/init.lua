vim.pack.add(require("plugins.package_specs").flatten(), { confirm = false, load = true })

-- ────────────────────────────────────────────────────────────────────────────────
-- Importing. Order Matters
-- ────────────────────────────────────────────────────────────────────────────────
require("plugins.tools")
require("plugins.ui.theme")
require("plugins.ui.cmdline")
require("plugins.ui.icons")
require("plugins.vcs.git")
require("plugins.editor.bufferline")
require("plugins.editor.sidebar")
require("plugins.editor.sessions")
