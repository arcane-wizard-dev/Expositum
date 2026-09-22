local addonName, EXT = ...

local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
local buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate") or ""

EXT.CHANGELOG = {
	{
		version = version,
		date = buildDate ~= "" and buildDate or nil,
		entries = {
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility",
			"Minor code adjustments"
		}
	},
	{
		version = "v2.25",
		date = "2026-09-18",
		entries = {
			"Added: TOC version for patch 1.60.1 [forever]",
			"Changed: Character profiles now use GUIDs",
			"Changed: Addon initialization stops if the player identity is unavailable"
		}
	},
	{
		version = "v2.24",
		date = "2026-09-13",
		entries = {
			"Updated: GitHub links following the organization rename to 'arcane-wizard-dev'"
		}
	},
	{
		version = "v2.23",
		date = "2026-09-06",
		entries = {
			"Added: Option to display the item's numeric ID in the tooltip",
			"Added: Option to display the maximum number of items per stack in the tooltip",
			"Added: Option to choose between two-column and left-aligned additional item information",
			"Added: Option to choose between badge-only, name-only, or combined expansion information [retail]",
			"Added: Option to hide the maximum stack size for non-stackable items",
			"Added: TOC version for patch 12.1.5 [retail]",
			"Changed: Tooltip options are organized into collapsible display and item information groups, with dependent settings disabled when their parent option is off",
			"Updated: enUS, ruRU localizations"
		}
	},
	{
		version = "v2.22",
		date = "2026-08-30",
		entries = {
			"Minor code adjustments"
		}
	},
	{
		version = "v2.21",
		date = "2026-08-18",
		entries = {
			"Added: Changelog window available from the options menu",
			"Added: Changelog window available through the 'changelog' slash command",
			"Removed: Version notice chat messages",
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility"
		}
	},
	{
		version = "v2.20",
		date = "2026-08-14",
		entries = {
			"Removed: TOC version for patch 12.0.7 [retail]"
		}
	},
	{
		version = "v2.19",
		date = "2026-08-04",
		entries = {
			"Minor code adjustments"
		}
	},
	{
		version = "v2.18",
		date = "2026-07-28",
		entries = {
			"Added: TOC version for patch 1.15.9 [classic]",
			"Added: Item rarity and color-coded expansion badges are now displayed",
			"Removed: TOC version for patch 1.15.8 [classic]",
			"Minor code adjustments",
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility"
		}
	},
	{
		version = "v2.17",
		date = "2026-07-18",
		entries = {
			"Minor code adjustments"
		}
	}
}
