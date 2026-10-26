local _, EXT = ...

if EXT.State and EXT.State.libraryIncompatible then return end

EXT.OPTIONS_DEFAULTS = {
	["general"] = {
		["minimap-button"] = {
			["hide"] = false,
			["minimapPos"] = 225,
			["lock"] = false,
			["showInCompartment"] = false
		},
		["debug-mode"] = false,
	},
	["tooltip"] = {
		["layout"] = "columns",
		["blank-line"] = true,
		["expansion"] = true,
		["expansion-display"] = "both",
		["category"] = true,
		["rarity"] = true,
		["item-level"] = true,
		["item-id"] = true,
		["max-stack-size"] = true,
		["hide-single-stack"] = true,
	},
}
