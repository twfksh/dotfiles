--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local wezterm = require("wezterm")
local action = wezterm.action
local bg = require("utils.background")
local wp = require("utils.wallpaper")

local rose_pine = require("colors.rose-pine").colors()
local win_frame = require("colors.rose-pine").window_frame()

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.default_prog = { "debian.exe" }
config.colors = rose_pine
config.window_frame = win_frame
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Regular", stretch = "Normal", style = "Normal" },
})
config.font_size = 15
config.background = {
	wp.get_wallpaper("F:/wallpapers-main/zen/*.jpg"),
	bg.get_background(0.85, 0.9),
}
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

-- Keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER", action = action.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = action.ActivateCopyMode },

	-- Pane keybindings
	{ key = "-", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- SHIFT is for when caps lock is on
	{ key = "|", mods = "LEADER|SHIFT", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = action.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = action.TogglePaneZoomState },
	{ key = "s", mods = "LEADER", action = action.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{ key = "r", mods = "LEADER", action = action.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- Tab keybindings
	{ key = "n", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = action.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = action.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = action.ShowTabNavigator },
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = action.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

	-- Some extras
	{ key = "Enter", mods = "ALT", action = action.ToggleFullScreen },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = action.MoveTabRelative(-1) },
		{ key = "j", action = action.MoveTabRelative(-1) },
		{ key = "k", action = action.MoveTabRelative(1) },
		{ key = "l", action = action.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
wezterm.on("update-right-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
	end
	if window:leader_is_active() then
		stat = "LDR"
	end

	-- Current working directory
	local basename = function(s)
		-- Nothign a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end
	local cwd = basename(pane:get_current_working_dir())
	-- Current command
	local cmd = basename(pane:get_foreground_process_name())

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Let's add color to one of the components
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "FFB86C" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = " |" },
	}))
end)

return config
