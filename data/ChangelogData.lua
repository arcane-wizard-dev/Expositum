local addonName, EXT = ...

local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
local buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate") or ""

EXT.CHANGELOG = {
	notices = {},
	{
		version = version,
		date = buildDate ~= "" and buildDate or nil,
		entries = {
			"Adapted to the latest version of Arcane Wizard: Library to ensure full compatibility"
		}
	},
	{
		version = "v2.32",
		date = "2026-10-14",
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
	}
}
