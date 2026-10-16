local addonName, EXT = ...

local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
local buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate") or ""

EXT.CHANGELOG = {
	notices = {},
	{
		version = version,
		date = buildDate ~= "" and buildDate or nil,
		entries = {
			"Fixed: Repeated error messages for missing translations"
		}
	},
	{
		version = "v2.31",
		date = "2026-10-12",
		entries = {
			"Refactoring of the addon structure and source code"
		}
	},
	{
		version = "v2.30",
		date = "2026-10-09",
		entries = {
			"Minor code adjustments"
		}
	},
	{
		version = "v2.29",
		date = "2026-10-03",
		entries = {
			"Changed: Maximum stack sizes now use thousands separators",
			"Updated: Logo"
		}
	},
	{
		version = "v2.28",
		date = "2026-09-27",
		entries = {
			"Minor code adjustments"
		}
	},
	{
		version = "v2.27",
		date = "2026-09-24",
		entries = {
			"Changed: Item categories are displayed only once when the category and subcategory match",
			"Updated: Compatibility with the beta client [forever]",
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility"
		}
	},
	{
		version = "v2.26",
		date = "2026-09-22",
		entries = {
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility",
			"Minor code adjustments"
		}
	},
	{
		version = "v2.25",
		date = "2026-09-18",
		entries = {
			"Added: Support for 'Forever'",
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
	}
}
