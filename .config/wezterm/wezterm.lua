local wezterm = require("wezterm")

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "tokyonight_storm"
	else
		return "Builtin Solarized Light"
	end
end

wezterm.on("window-config-reloaded", function(window, _)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

local config = {}

-- config.color_scheme = "tokyonight_day"
config.send_composed_key_when_left_alt_is_pressed = true
config.enable_tab_bar = false

return config
