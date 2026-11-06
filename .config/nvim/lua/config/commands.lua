local lorem_words = [[
  lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut
  labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris
  nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit voluptate velit
  esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt
  in culpa qui officia deserunt mollit anim id est laborum
]]

local words = vim.split(vim.trim(lorem_words), "%s+")

local function lorem(count)
  count = count or 50
  local result = {}

  for i = 1, count do
    result[i] = words[(i - 1) % #words + 1]
  end

  result[1] = result[1]:sub(1, 1):upper() .. result[1]:sub(2)
  result[#result] = result[#result] .. "."
  vim.api.nvim_put({ table.concat(result, " ") }, "c", true, true)
end

vim.api.nvim_create_user_command("Lorem", function(opts)
  local count = tonumber(opts.args)
  if opts.args ~= "" and (not count or count < 1 or count % 1 ~= 0) then
    vim.notify("Lorem expects a positive whole number of words", vim.log.levels.ERROR)
    return
  end

  lorem(count)
end, {
  nargs = "?",
  desc = "Insert generated Lorem Ipsum text",
})
