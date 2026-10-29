local addonName, EXT = ...

if EXT.State and EXT.State.libraryIncompatible then return end

local version = C_AddOns.GetAddOnMetadata(addonName, "Version") or ""
local buildDate = C_AddOns.GetAddOnMetadata(addonName, "X-BuildDate") or ""

EXT.CHANGELOG = {
	notices = {},
	-- BEGIN GENERATED CHANGELOG
	{
		version = version,
		date = buildDate ~= "" and buildDate or nil,
		entries = {
			"Added: TOC version for patch 12.1.7 [retail]",
			"Removed: TOC version for patch 12.1.0 [retail]"
		}
	},
	{
		version = "v2.34",
		date = "2026-10-28",
		entries = {
			"Added: Startup check for the minimum required Library revision",
			"Updated: deDE, enUS, ruRU localizations",
			"Updated: Addon description",
			"Minor code adjustments"
		}
	},
	{
		version = "v2.33",
		date = "2026-10-16",
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
	}
	-- END GENERATED CHANGELOG
}
