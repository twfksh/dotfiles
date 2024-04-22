local wezterm = require("wezterm")
local appearance = wezterm.gui.get_appearance()
local M = {}

M.is_dark = function()
	return appearance:find("Dark")
end

M.get_random_entry = function(tbl)
	local keys = {}

	for key, _ in ipairs(tbl) do
		table.insert(keys, key)
	end

	local rand_key = keys[math.random(1, #keys)]
	return tbl[rand_key]
end

return M
