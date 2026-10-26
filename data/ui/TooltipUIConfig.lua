local addonName, EXT = ...

if EXT.State and EXT.State.libraryIncompatible then return end

local expansionBadgePath = "Interface\\AddOns\\" .. addonName .. "\\assets\\expansion-badges\\"

EXT.UIConfig.Tooltip = {
	expansionDisplayOptions = {
		{ value = "both", label = EXT.Localization["options.tooltip.expansion-display.both"] },
		{ value = "badge", label = EXT.Localization["options.tooltip.expansion-display.badge"] },
		{ value = "name", label = EXT.Localization["options.tooltip.expansion-display.name-only"] }
	},
	layoutOptions = {
		{ value = "columns", label = EXT.Localization["options.tooltip.layout.columns"] },
		{ value = "left", label = EXT.Localization["options.tooltip.layout.left"] }
	},
	expansionBadges = {
		[0]  = { abbreviation = "CL",    color = "D8B45A", texture = expansionBadgePath .. "classic.tga" },
		[1]  = { abbreviation = "TBC",   color = "9BBF4B", texture = expansionBadgePath .. "burning-crusade.tga" },
		[2]  = { abbreviation = "WotLK", color = "78C8E8", texture = expansionBadgePath .. "wrath-of-the-lich-king.tga" },
		[3]  = { abbreviation = "Cata",  color = "F0643C", texture = expansionBadgePath .. "cataclysm.tga" },
		[4]  = { abbreviation = "MoP",   color = "45C58A", texture = expansionBadgePath .. "mists-of-pandaria.tga" },
		[5]  = { abbreviation = "WoD",   color = "C76A4A", texture = expansionBadgePath .. "warlords-of-draenor.tga" },
		[6]  = { abbreviation = "LEG",   color = "9AF05A", texture = expansionBadgePath .. "legion.tga" },
		[7]  = { abbreviation = "BfA",   color = "4FA7D9", texture = expansionBadgePath .. "battle-for-azeroth.tga" },
		[8]  = { abbreviation = "SL",    color = "C2C7CF", texture = expansionBadgePath .. "shadowlands.tga" },
		[9]  = { abbreviation = "DF",    color = "D1A25A", texture = expansionBadgePath .. "dragonflight.tga" },
		[10] = { abbreviation = "TWW",   color = "F39A3F", texture = expansionBadgePath .. "the-war-within.tga" },
		[11] = { abbreviation = "MID",   color = "A47BE8", texture = expansionBadgePath .. "midnight.tga" }
	}
}
