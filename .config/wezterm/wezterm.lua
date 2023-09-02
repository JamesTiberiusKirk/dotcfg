local wezterm = require("wezterm")
local act = wezterm.action

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "tokyonight_storm"
		return "Gruvbox dark, hard (base16)"
	else
		-- return "Builtin Solarized Light"
		return "Gruvbox Light"
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

return {
	keys = {
		{
			key = "E",
			mods = "CTRL|SHIFT",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	},
	send_composed_key_when_left_alt_is_pressed = true,
	enable_tab_bar = false,
}
