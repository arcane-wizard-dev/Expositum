local _, EXT = ...

EXT.Localization = setmetatable({},{__index=function(self,key)
		geterrorhandler()("Expositum (Debug): Missing entry for '" .. tostring(key) .. "'")
		return key
	end})

local L = EXT.Localization

-- Options

L["options.general"] = "General Options"
L["options.general.minimap-button.name"] = "Minimap Button"
L["options.general.minimap-button.tooltip"] = "When this is enabled, the minimap button is displayed."
L["options.general.debug-mode.name"] = "Debug Mode"
L["options.general.debug-mode.tooltip"] = "Enabling the debug mode displays additional information in the chat."

L["options.tooltip"] = "Tooltip"
L["options.tooltip.section.display"] = "Display"
L["options.tooltip.section.item-info"] = "Item Information"
L["options.tooltip.layout.name"] = "Alignment"
L["options.tooltip.layout.tooltip"] = "Arranges Expositum's additional information in two columns or left-aligned as Label: Value."
L["options.tooltip.layout.columns"] = "Two Columns"
L["options.tooltip.layout.left"] = "Left-Aligned"
L["options.tooltip.expansion.name"] = "Show Expansion"
L["options.tooltip.expansion.tooltip"] = "Displays the corresponding expansion for items in the tooltip."
L["options.tooltip.expansion-display.name"] = "Expansion Display"
L["options.tooltip.expansion-display.tooltip"] = "Displays the expansion as a badge, a name, or both. Requires Show Expansion."
L["options.tooltip.expansion-display.both"] = "Badge and Name"
L["options.tooltip.expansion-display.badge"] = "Badge Only"
L["options.tooltip.expansion-display.name-only"] = "Name Only"
L["options.tooltip.category.name"] = "Show Category"
L["options.tooltip.category.tooltip"] = "Displays the corresponding category for items in the tooltip."
L["options.tooltip.rarity.name"] = "Show Rarity"
L["options.tooltip.rarity.tooltip"] = "Displays the corresponding rarity for items in the tooltip."
L["options.tooltip.item-level.name"] = "Show Item Level"
L["options.tooltip.item-level.tooltip"] = "Displays the corresponding item level for items in the tooltip."
L["options.tooltip.item-id.name"] = "Show Item ID"
L["options.tooltip.item-id.tooltip"] = "Displays the item's numeric ID in the tooltip."
L["options.tooltip.max-stack-size.name"] = "Show Maximum Stack Size"
L["options.tooltip.max-stack-size.tooltip"] = "Displays the maximum number of items per stack, not the quantity currently owned."
L["options.tooltip.hide-single-stack.name"] = "Hide Stack Size 1"
L["options.tooltip.hide-single-stack.tooltip"] = "Only displays the maximum stack size for stackable items. Disable this to also show 1 for non-stackable items."
L["options.tooltip.blank-line.name"] = "Insert Blank Line"
L["options.tooltip.blank-line.tooltip"] = "Inserts a blank line before the additional item information in the tooltip."

-- General


L["minimap-button.tooltip"] = "|cnLINK_FONT_COLOR:Right-click|r to open the options."

-- Chat

-- Tooltip

L["tooltip.expansion"] = "Expansion"
L["tooltip.category"] = "Category"
L["tooltip.rarity"] = "Rarity"
L["tooltip.item-level"] = "Item Level"
L["tooltip.item-id"] = "Item ID"
L["tooltip.max-stack-size"] = "Max. Stack Size"
