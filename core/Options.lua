local addonName, EXT = ...

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

-- Localization
local L = EXT.Localization

-- Current module
local Options = EXT.Modules.Options

-- Module imports
local Utils = EXT.Modules.Utils

-- Variables
local minimapButtonProxy = setmetatable({}, {
	__index = function(_, key)
		if key == "hide" then
			return not EXT.Settings.general["minimap-button"]["hide"]
		end
	end,
	__newindex = function(_, key, value)
		if key ~= "hide" then
			return
		end

		EXT.Settings.general["minimap-button"]["hide"] = not value

		if value then
			Utils.minimapButton:Show(addonName)
		else
			Utils.minimapButton:Hide(addonName)
		end
	end,
})

------------------------
--- Module Functions ---
------------------------

function Options:Initialize()
	local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["options.general"]))

	-- Minimap Button
	AWL.Settings:AddCheckbox(category, {
		variableTable	= minimapButtonProxy,
		settingKey		= addonName .. "_hide",
		variableName	= "hide",
		name			= L["options.general.minimap-button.name"],
		tooltip			= L["options.general.minimap-button.tooltip"],
		default			= true
	})

	-- Debug Mode
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.general,
		settingKey		= addonName .. "_debug-mode",
		variableName	= "debug-mode",
		name			= L["options.general.debug-mode.name"],
		tooltip			= L["options.general.debug-mode.tooltip"],
		default			= false
	})

	layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["options.tooltip"]))
	local _, isDisplayExpanded = AWL.Settings:AddExpandableHeader(layout, L["options.tooltip.section.display"])

	-- Layout
	AWL.Settings:AddDropdown(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_layout",
		variableName	= "layout",
		name			= L["options.tooltip.layout.name"],
		tooltip			= L["options.tooltip.layout.tooltip"],
		default			= "columns",
		options			= EXT.TOOLTIP_LAYOUT_OPTIONS,
		shownPredicate	= isDisplayExpanded
	})

	-- Blank Line
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_blank-line",
		variableName	= "blank-line",
		name			= L["options.tooltip.blank-line.name"],
		tooltip			= L["options.tooltip.blank-line.tooltip"],
		default			= true,
		shownPredicate	= isDisplayExpanded
	})

	local _, isItemInfoExpanded = AWL.Settings:AddExpandableHeader(layout, L["options.tooltip.section.item-info"])

	-- Expansion Check
	if AWL.GAME_TYPE_MAINLINE then
		local expansionInitializer, expansionSetting = AWL.Settings:AddCheckbox(category, {
			variableTable	= EXT.Settings.tooltip,
			settingKey		= addonName .. "_expansion",
			variableName	= "expansion",
			name			= L["options.tooltip.expansion.name"],
			tooltip			= L["options.tooltip.expansion.tooltip"],
			default			= true,
			shownPredicate	= isItemInfoExpanded
		})

		AWL.Settings:AddDropdown(category, {
			variableTable	= EXT.Settings.tooltip,
			settingKey		= addonName .. "_expansion-display",
			variableName	= "expansion-display",
			name			= L["options.tooltip.expansion-display.name"],
			tooltip			= L["options.tooltip.expansion-display.tooltip"],
			default			= "both",
			options			= EXT.EXPANSION_DISPLAY_OPTIONS,
			parentInit		= expansionInitializer,
			parentCondition	= function() return expansionSetting:GetValue() end,
			shownPredicate	= isItemInfoExpanded
		})
	end

	-- Category
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_category",
		variableName	= "category",
		name			= L["options.tooltip.category.name"],
		tooltip			= L["options.tooltip.category.tooltip"],
		default			= true,
		shownPredicate	= isItemInfoExpanded
	})

	-- Rarity
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_rarity",
		variableName	= "rarity",
		name			= L["options.tooltip.rarity.name"],
		tooltip			= L["options.tooltip.rarity.tooltip"],
		default			= true,
		shownPredicate	= isItemInfoExpanded
	})

	-- Item Level
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_item-level",
		variableName	= "item-level",
		name			= L["options.tooltip.item-level.name"],
		tooltip			= L["options.tooltip.item-level.tooltip"],
		default			= true,
		shownPredicate	= isItemInfoExpanded
	})

	-- Item ID
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_item-id",
		variableName	= "item-id",
		name			= L["options.tooltip.item-id.name"],
		tooltip			= L["options.tooltip.item-id.tooltip"],
		default			= true,
		shownPredicate	= isItemInfoExpanded
	})

	-- Maximum Stack Size
	local stackInitializer, stackSetting = AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_max-stack-size",
		variableName	= "max-stack-size",
		name			= L["options.tooltip.max-stack-size.name"],
		tooltip			= L["options.tooltip.max-stack-size.tooltip"],
		default			= true,
		shownPredicate	= isItemInfoExpanded
	})

	-- Hide Non-stackable Items
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_hide-single-stack",
		variableName	= "hide-single-stack",
		name			= L["options.tooltip.hide-single-stack.name"],
		tooltip			= L["options.tooltip.hide-single-stack.tooltip"],
		default			= true,
		parentInit		= stackInitializer,
		parentCondition	= function() return stackSetting:GetValue() end,
		shownPredicate	= isItemInfoExpanded
	})

	-- Profiles Section
	AWL.Settings:AddProfilesSection(layout, {
		useAccountProfile			= Utils:IsAccountProfile(),
		onSwitchProfile				= function()
			Utils:ToggleProfileMode()
			ReloadUI()
		end,
		onDeleteCharacterProfiles	= function()
			Utils:ResetAllCharacterProfiles()
			ReloadUI()
		end
	})

	-- About Section
	AWL.Settings:AddAboutSection(layout, addonName, EXT.CHANGELOG)

	Settings.RegisterAddOnCategory(category)

	Addon:SetMainCategoryId(category:GetID())
end
