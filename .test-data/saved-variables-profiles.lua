-- Synthetic SavedVariables: account, current and offline character profiles; preserve false and zero.
-- No real player data. Version "test" is the version supplied by the test harness.

Expositum_Options_v4 = {
	["account"] = {
		["general"] = {
			["debug-mode"] = false,
			["minimap-button"] = {
				["hide"] = false,
				["lock"] = false,
				["minimapPos"] = 90,
				["showInCompartment"] = false,
			},
		},
		["tooltip"] = {
			["blank-line"] = false,
			["category"] = true,
			["expansion"] = true,
			["expansion-display"] = "both",
			["hide-single-stack"] = true,
			["item-id"] = false,
			["item-level"] = true,
			["layout"] = "columns",
			["max-stack-size"] = true,
			["rarity"] = true,
		},
	},
	["global"] = {
		["version"] = "test",
	},
	["profileKeys"] = {
		["Player-TEST-CURRENT"] = {
			["open-settings"] = false,
			["use-account"] = false,
		},
		["Player-TEST-OFFLINE"] = {
			["open-settings"] = false,
			["use-account"] = true,
		},
	},
	["profiles"] = {
		["Player-TEST-CURRENT"] = {
			["general"] = {
				["debug-mode"] = false,
				["minimap-button"] = {
					["hide"] = true,
					["lock"] = false,
					["minimapPos"] = 0,
					["showInCompartment"] = false,
				},
			},
			["tooltip"] = {
				["blank-line"] = false,
				["category"] = true,
				["expansion"] = true,
				["expansion-display"] = "both",
				["hide-single-stack"] = true,
				["item-id"] = false,
				["item-level"] = true,
				["layout"] = "columns",
				["max-stack-size"] = true,
				["rarity"] = true,
			},
		},
		["Player-TEST-OFFLINE"] = {
			["general"] = {
				["debug-mode"] = false,
				["minimap-button"] = {
					["hide"] = false,
					["lock"] = false,
					["minimapPos"] = 270,
					["showInCompartment"] = false,
				},
			},
			["tooltip"] = {
				["blank-line"] = false,
				["category"] = true,
				["expansion"] = true,
				["expansion-display"] = "both",
				["hide-single-stack"] = true,
				["item-id"] = false,
				["item-level"] = true,
				["layout"] = "columns",
				["max-stack-size"] = true,
				["rarity"] = true,
			},
		},
	},
}
