return {
  -- Disable LazyVim's default session plugin.
  -- LazyVim ships with persistence.nvim for session management,
  -- but we are using auto-session instead to get automatic restore/save.
  {
    "folke/persistence.nvim",
    enabled = false,
  },

  {
    "rmagatti/auto-session",
    lazy = false,

    keys = {
      { "<leader>qs", "<cmd>AutoSession search<CR>", desc = "Session Search" },
      { "<leader>qr", "<cmd>AutoSession restore<CR>", desc = "Session Restore" },
      { "<leader>qw", "<cmd>AutoSession save<CR>", desc = "Session Save" },
      { "<leader>qd", "<cmd>AutoSession delete<CR>", desc = "Session Delete" },
      { "<leader>qa", "<cmd>AutoSession toggle<CR>", desc = "Session Toggle Autosave" },
    },

    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      -- Do not create/restore sessions in generic directories.
      suppressed_dirs = {
        "~/",
        "~/Desktop",
        "~/Documents",
        "~/Downloads",
        "/",
      },

      -- LazyVim usually has Snacks available, but auto-session can also
      -- auto-detect Telescope, Snacks, Fzf-Lua, or fallback to vim.ui.select.
      session_lens = {
        picker = "snacks",
      },
    },
  },

  --[[
  NOTE: Session management options note for future:

  Want the LazyVim-native path?
  -> Use built-in persistence.nvim.

  Want auto-restore every time you open a project?
  -> Keep persistence.nvim and add a VimEnter autocmd.

  Want VS Code-like “workspace restore” behavior?
  -> Use auto-session.

  Work across git branches/worktrees a lot?
  -> Use persisted.nvim.

  Want minimal, explicit, stable primitives?
  -> Use mini.sessions or raw :mksession.

  Current choice:
  -> auto-session, because I want automatic project/workspace restore.
  ]]
}
