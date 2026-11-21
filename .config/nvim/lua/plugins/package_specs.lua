-- Plugin specs grouped by feature. Dependency edges are resolved below into
-- the flat, dependency-first list expected by vim.pack.add().
local tree = {
	ui = {
		{
			name = "catppuccin",
			spec = {
				src = "https://github.com/catppuccin/nvim.git",
				name = "catppuccin",
				version = "edefef779ab08ce1a4a404713e3012b0d202bd35",
			},
		},
		{
			name = "snacks.nvim",
			spec = {
				src = "https://github.com/folke/snacks.nvim.git",
				version = "882c996cf28183f4d63640de0b4c02ec886d01f2",
			},
		},
		{
			name = "noice.nvim",
			spec = {
				src = "https://github.com/folke/noice.nvim.git",
				version = "v4.10.0",
			},
			depends_on = { "nui.nvim" },
		},
	},
	editor = {
		{
			name = "bufferline.nvim",
			spec = {
				src = "https://github.com/akinsho/bufferline.nvim.git",
				version = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3",
			},
		},
		{
			name = "neo-tree.nvim",
			spec = {
				src = "https://github.com/nvim-neo-tree/neo-tree.nvim.git",
				version = "760d9701953ad2b0277fe9776ba99bb011ecac2b",
			},
			depends_on = { "plenary.nvim", "nui.nvim" },
		},
		{
			name = "real-icons.nvim",
			spec = {
				src = "https://github.com/Mirsmog/real-icons.nvim.git",
				version = "9c13a7a3f3072fbceb847c8db15e941b60ea666f",
			},
			depends_on = { "neo-tree.nvim" }, -- Neo-tree integration enabled in this config.
		},
		{
			name = "auto-session",
			spec = {
				src = "https://github.com/rmagatti/auto-session.git",
				version = "02a5588f677970a9bc784115c62bef9e5855499b",
			},
			depends_on = { "snacks.nvim" }, -- Session picker is configured to use Snacks.
		},
	},
	vcs = {
		{
			name = "gitsigns.nvim",
			spec = {
				src = "https://github.com/lewis6991/gitsigns.nvim.git",
				version = "c0862d382a35b7b45757d8d151a6a634c09bf3ce",
			},
		},
	},
	tooling = {
		{
			name = "mason.nvim",
			spec = {
				src = "https://github.com/mason-org/mason.nvim.git",
				version = "2a6940af80375532e5e9e7c1f2fc6319a1b7a69d",
			},
		},
		{
			name = "nvim-lspconfig",
			spec = {
				src = "https://github.com/neovim/nvim-lspconfig.git",
				version = "4648fd8ba5c678d7e2db75ae44ffac269bb589d8",
			},
		},
	},
	shared = {
		{
			name = "plenary.nvim",
			spec = {
				src = "https://github.com/nvim-lua/plenary.nvim.git",
				version = "74b06c6c75e4eeb3108ec01852001636d85a932b",
			},
		},
		{
			name = "nui.nvim",
			spec = {
				src = "https://github.com/MunifTanjim/nui.nvim.git",
				version = "10fc361835c856ba4233ef5ea135b919bf3dce97",
			},
		},
	},
}

local group_order = { "ui", "editor", "vcs", "tooling", "shared" }
local nodes = {}
for _, group in ipairs(group_order) do
	for _, node in ipairs(tree[group]) do
		nodes[node.name] = node
	end
end

local function flatten()
	local packages = {}
	local added = {}
	local visiting = {}

	local function add(name)
		if added[name] then
			return
		end
		assert(not visiting[name], "cyclic plugin dependency at " .. name)

		local node = assert(nodes[name], "missing plugin tree entry: " .. name)
		visiting[name] = true
		for _, dependency in ipairs(node.depends_on or {}) do
			add(dependency)
		end
		visiting[name] = nil
		added[name] = true
		packages[#packages + 1] = node.spec
	end

	for _, group in ipairs(group_order) do
		for _, node in ipairs(tree[group]) do
			add(node.name)
		end
	end

	return packages
end

return {
	flatten = flatten,
}
