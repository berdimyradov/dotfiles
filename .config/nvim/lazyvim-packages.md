# LazyVim package inventory

Inventory of the existing `nvim` profile for future restoration. The standalone trial is in `nvim-minimal/`; this inventory leaves the legacy profile intact.

## Imports and extras

The legacy profile imports:

- `LazyVim/LazyVim` with `lazyvim.plugins` from `nvim/lua/config/lazy.lua`.
- Explicit Lua imports: `lazyvim.plugins.extras.lang.json`, `lang.typescript`, `linting.eslint`, `test.core`, and `ui.mini-animate`.
- User selected extras in `nvim/lazyvim.json`: `coding.mini-surround`, `editor.outline`, `lang.markdown`, and `test.core`. `test.core` is imported by both files.
- The custom `plugins` import, which loads `plugins.coding`, `plugins.editor`, `plugins.git`, and `plugins.ui`.

Custom settings include Neo-tree's float/left toggle, filename/full-path copy mappings, and visibility filters; Catppuccin; Gitsigns signs and colors; auto-session with Snacks picker; the Diffview fork; mini.icons (active in the current legacy profile); and statusline, bufferline, Markdown, and highlight-color settings. The current profile explicitly disables `grug-far.nvim` and `persistence.nvim`; it disables inlay hints and the `marksman` server. RealIcons is part of the standalone trial and does not appear in this legacy lock.

## Locked plugins

Status meanings: **Active** is present in the current LazyVim core, a selected extra, or a custom spec; **Disabled** is explicitly disabled by the current config. Standalone carry-over is listed separately below.

| Plugin | Branch | Commit | Status |
| --- | --- | --- | --- |
| `auto-session` | `main` | `02a5588f677970a9bc784115c62bef9e5855499b` | Active |
| `blink.cmp` | `main` | `78336bc89ee5365633bcf754d93df01678b5c08f` | Active |
| `bufferline.nvim` | `main` | `655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3` | Active |
| `catppuccin` | `main` | `edefef779ab08ce1a4a404713e3012b0d202bd35` | Active |
| `conform.nvim` | `master` | `016802de402556da54c36bd7359b441266b01cdd` | Active |
| `diffview.nvim` | `main` | `fae72d6c981075dce2e0f946f002382ce0cb44e1` | Active |
| `flash.nvim` | `main` | `5f0f270fdc7c5b0c21d903ee85b9cb06f2ac636a` | Active |
| `friendly-snippets` | `main` | `7a1c9f7897a4eb078b157a04c7af81e5869215b1` | Active |
| `fzf-lua` | `main` | `a8312697c30b4d3b110fa3dc56e3699107aed9a0` | Active |
| `gitsigns.nvim` | `main` | `c0862d382a35b7b45757d8d151a6a634c09bf3ce` | Active |
| `grug-far.nvim` | `main` | `11595bf747edc270bce2069d1020502ad4ae56cf` | Disabled |
| `lazy.nvim` | `main` | `85c7ff3711b730b4030d03144f6db6375044ae82` | Active |
| `lazydev.nvim` | `main` | `ff2cbcba459b637ec3fd165a2be59b7bbaeedf0d` | Active |
| `LazyVim` | `main` | `0fa4a847929fc6beae40a3063615a58115678c34` | Active |
| `lualine.nvim` | `master` | `221ce6b2d999187044529f49da6554a92f740a96` | Active |
| `markdown-preview.nvim` | `master` | `a923f5fc5ba36a3b17e289dc35dc17f66d0548ee` | Active |
| `mason-lspconfig.nvim` | `main` | `761d376b5fbe6b21f659432ffadc1205c660176c` | Active |
| `mason.nvim` | `main` | `2a6940af80375532e5e9e7c1f2fc6319a1b7a69d` | Active |
| `mini.ai` | `main` | `813d10a43d5d4eda4816e6a27eb6bf6250f75ea8` | Active |
| `mini.animate` | `main` | `e9c962aaa2c51e856ba7efd553eeaab965e782ad` | Active |
| `mini.icons` | `main` | `5d58117d176c133f4cb5585ec8cb3450881c89a0` | Active |
| `mini.pairs` | `main` | `e332261859814c307e72458222070f84b6d6f4e8` | Active |
| `mini.surround` | `main` | `77f376bdebb3440ad13bc40b48062b29bccb7577` | Active |
| `neo-tree.nvim` | `main` | `760d9701953ad2b0277fe9776ba99bb011ecac2b` | Active |
| `neotest` | `master` | `27bf921498043f7ecd821d6db68d05de244bbd02` | Active |
| `neotest-vitest` | `main` | `b0c265743c877058068dbc40d104ea5d40e6b257` | Active |
| `noice.nvim` | `main` | `7bfd942445fb63089b59f97ca487d605e715f155` | Active |
| `nui.nvim` | `main` | `10fc361835c856ba4233ef5ea135b919bf3dce97` | Active |
| `nvim-highlight-colors` | `main` | `e4c7af0211866162d999ce0bdd6a029302e19139` | Active |
| `nvim-lint` | `master` | `6bf29b9dbdad60b38b489b23309c22ba6d4c915a` | Active |
| `nvim-lspconfig` | `master` | `4648fd8ba5c678d7e2db75ae44ffac269bb589d8` | Active |
| `nvim-nio` | `master` | `edcc181a875301dd21840189aa2f2f9ad69fc172` | Active |
| `nvim-treesitter` | `main` | `37e52c733ada9d8d544d53a763140ef1ba404353` | Active |
| `nvim-treesitter-textobjects` | `main` | `5c7b0263797dfd1bd6202f2b219f3b53a80b2187` | Active |
| `nvim-ts-autotag` | `main` | `d7220b55e16ed3c04e88086256def5d282429493` | Active |
| `outline.nvim` | `main` | `6f95d46ff1d128fd4e6ec77f660caec6ad40a122` | Active |
| `persistence.nvim` | `main` | `b20b2a7887bd39c1a356980b45e03250f3dce49c` | Disabled |
| `plenary.nvim` | `master` | `74b06c6c75e4eeb3108ec01852001636d85a932b` | Active |
| `render-markdown.nvim` | `main` | `a67f826164c38c836fc6060f32b275c4c43317a7` | Active |
| `SchemaStore.nvim` | `main` | `abc95e13502ff3acbed151de97667174b2e4132d` | Active |
| `snacks.nvim` | `main` | `882c996cf28183f4d63640de0b4c02ec886d01f2` | Active |
| `todo-comments.nvim` | `main` | `31e3c38ce9b29781e4422fc0322eb0a21f4e8668` | Active |
| `tokyonight.nvim` | `main` | `cdc07ac78467a233fd62c493de29a17e0cf2b2b6` | Active |
| `trouble.nvim` | `main` | `bd67efe408d4816e25e8491cc5ad4088e708a69a` | Active |
| `ts-comments.nvim` | `main` | `a59d6092213447450191122c9346f309161504cb` | Active |
| `which-key.nvim` | `main` | `3aab2147e74890957785941f0c1ad87d0a44c15a` | Active |

## Standalone carry-over

The standalone profile retains nine plugins from this lock: `catppuccin`, `snacks.nvim`, `plenary.nvim`, `nui.nvim`, `neo-tree.nvim`, `gitsigns.nvim`, `auto-session`, `mason.nvim`, and `nvim-lspconfig`. It also adds `real-icons.nvim`, which is not in the current legacy lock.

## Installed Mason packages

These package directories are present under `local/share/nvim/mason/packages`:

- `codelldb`
- `eslint-lsp`
- `json-lsp`
- `lua-language-server`
- `markdown-toc`
- `markdownlint-cli2`
- `marksman`
- `oxfmt`
- `shfmt`
- `stylua`
- `tree-sitter-cli`
- `vtsls`

The three server packages requested for the standalone profile are installed: `lua-language-server`, `vtsls`, and `json-lsp` (Neovim config names: `lua_ls`, `vtsls`, and `jsonls`). `marksman` is present in the legacy Mason data but disabled by the current LSP config. For a fresh standalone profile, Mason can provision the three requested packages with `:MasonInstall lua-language-server vtsls json-lsp`.
