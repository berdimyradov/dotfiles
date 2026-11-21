local plugins = {
  { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin", version = "edefef779ab08ce1a4a404713e3012b0d202bd35" },
  { src = "https://github.com/folke/snacks.nvim.git", version = "882c996cf28183f4d63640de0b4c02ec886d01f2" },
  { src = "https://github.com/nvim-lua/plenary.nvim.git", version = "74b06c6c75e4eeb3108ec01852001636d85a932b" },
  { src = "https://github.com/MunifTanjim/nui.nvim.git", version = "10fc361835c856ba4233ef5ea135b919bf3dce97" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim.git", version = "760d9701953ad2b0277fe9776ba99bb011ecac2b" },
  { src = "https://github.com/Mirsmog/real-icons.nvim.git", version = "9c13a7a3f3072fbceb847c8db15e941b60ea666f" },
  { src = "https://github.com/lewis6991/gitsigns.nvim.git", version = "c0862d382a35b7b45757d8d151a6a634c09bf3ce" },
  { src = "https://github.com/rmagatti/auto-session.git", version = "02a5588f677970a9bc784115c62bef9e5855499b" },
  { src = "https://github.com/mason-org/mason.nvim.git", version = "2a6940af80375532e5e9e7c1f2fc6319a1b7a69d" },
  { src = "https://github.com/neovim/nvim-lspconfig.git", version = "4648fd8ba5c678d7e2db75ae44ffac269bb589d8" },
}

vim.pack.add(plugins, { confirm = false, load = true })

require("catppuccin").setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  styles = {
    comments = { "italic" },
    keywords = { "bold" },
    types = { "italic", "bold" },
  },
})
vim.cmd.colorscheme("catppuccin")

require("snacks").setup({
  picker = { enabled = true },
  terminal = { enabled = true },
})

require("mason").setup({
  PATH = "prepend",
})

require("gitsigns").setup({
  signs_staged_enable = true,
  on_attach = function(buffer)
    local gitsigns = require("gitsigns")
    local maps = {
      { "<leader>hs", gitsigns.stage_hunk, "Stage hunk" },
      { "<leader>hr", gitsigns.reset_hunk, "Reset hunk" },
      { "<leader>hS", gitsigns.stage_buffer, "Stage buffer" },
      { "<leader>hu", gitsigns.undo_stage_hunk, "Undo stage hunk" },
      { "<leader>hR", gitsigns.reset_buffer, "Reset buffer" },
      { "<leader>hp", gitsigns.preview_hunk, "Preview hunk" },
      { "<leader>hb", gitsigns.blame_line, "Blame line" },
    }
    for _, map in ipairs(maps) do
      vim.keymap.set("n", map[1], map[2], { buffer = buffer, desc = map[3] })
    end
    vim.keymap.set("n", "]c", function()
      gitsigns.nav_hunk("next")
    end, { buffer = buffer, desc = "Next Git hunk" })
    vim.keymap.set("n", "[c", function()
      gitsigns.nav_hunk("prev")
    end, { buffer = buffer, desc = "Previous Git hunk" })
  end,
})

require("neo-tree").setup({
  window = {
    width = 40,
    mappings = {
      ["z"] = "none",
      ["zM"] = "close_all_nodes",
      ["zR"] = "expand_all_nodes",
      ["<leader>p"] = {
        function(state)
          local command = require("neo-tree.command")
          local position = state.current_position == "float" and "left" or "float"
          command.execute({ action = "close", source = state.name })
          command.execute({ action = "focus", source = state.name, position = position })
        end,
        desc = "Toggle float/left position",
      },
      ["c"] = "copy_to_clipboard",
      ["y"] = {
        function(state)
          local node = state.tree:get_node()
          local filename = vim.fn.fnamemodify(node.path, ":t")
          vim.fn.setreg("+", filename)
          vim.notify("Copied filename: " .. filename)
        end,
        desc = "Copy filename",
      },
      ["Y"] = {
        function(state)
          local node = state.tree:get_node()
          local path = vim.fn.fnamemodify(node.path, ":p")
          vim.fn.setreg("+", path)
          vim.notify("Copied full path: " .. path)
        end,
        desc = "Copy full path",
      },
    },
    position = "left",
    popup = {
      position = { row = "50%", col = "0%" },
      size = { height = "93%", width = "30%" },
    },
  },
  filesystem = {
    follow_current_file = { enabled = false },
    filtered_items = {
      visible = true,
      never_show = { ".DS_Store", ".git" },
      always_show = { ".gitignore" },
    },
  },
})

require("real-icons").setup({
  pack = "material",
  integrations = {
    neo_tree = true,
  },
})

require("auto-session").setup({
  suppressed_dirs = { "~/", "~/Desktop", "~/Documents", "~/Downloads", "/" },
  session_lens = { picker = "snacks" },
})
