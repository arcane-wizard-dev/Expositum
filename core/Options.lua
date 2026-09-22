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
local defaults = EXT.OPTIONS_DEFAULTS
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
		default			= not defaults.general["minimap-button"].hide
	})

	-- Debug Mode
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.general,
		settingKey		= addonName .. "_debug-mode",
		variableName	= "debug-mode",
		name			= L["options.general.debug-mode.name"],
		tooltip			= L["options.general.debug-mode.tooltip"],
		default			= defaults["general"]["debug-mode"]
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
		default			= defaults["tooltip"]["layout"],
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
		default			= defaults["tooltip"]["blank-line"],
		shownPredicate	= isDisplayExpanded
	})

	local _, isItemInfoExpanded = AWL.Settings:AddExpandableHeader(layout, L["options.tooltip.section.item-info"])

	-- Expansion Check
	if AWL.GAME_TYPE_RETAIL or AWL.GAME_TYPE_FOREVER then
		local expansionInitializer, expansionSetting = AWL.Settings:AddCheckbox(category, {
			variableTable	= EXT.Settings.tooltip,
			settingKey		= addonName .. "_expansion",
			variableName	= "expansion",
			name			= L["options.tooltip.expansion.name"],
			tooltip			= L["options.tooltip.expansion.tooltip"],
			default			= defaults["tooltip"]["expansion"],
			shownPredicate	= isItemInfoExpanded
		})

		AWL.Settings:AddDropdown(category, {
			variableTable	= EXT.Settings.tooltip,
			settingKey		= addonName .. "_expansion-display",
			variableName	= "expansion-display",
			name			= L["options.tooltip.expansion-display.name"],
			tooltip			= L["options.tooltip.expansion-display.tooltip"],
			default			= defaults["tooltip"]["expansion-display"],
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
		default			= defaults["tooltip"]["category"],
		shownPredicate	= isItemInfoExpanded
	})

	-- Rarity
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_rarity",
		variableName	= "rarity",
		name			= L["options.tooltip.rarity.name"],
		tooltip			= L["options.tooltip.rarity.tooltip"],
		default			= defaults["tooltip"]["rarity"],
		shownPredicate	= isItemInfoExpanded
	})

	-- Item Level
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_item-level",
		variableName	= "item-level",
		name			= L["options.tooltip.item-level.name"],
		tooltip			= L["options.tooltip.item-level.tooltip"],
		default			= defaults["tooltip"]["item-level"],
		shownPredicate	= isItemInfoExpanded
	})

	-- Item ID
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_item-id",
		variableName	= "item-id",
		name			= L["options.tooltip.item-id.name"],
		tooltip			= L["options.tooltip.item-id.tooltip"],
		default			= defaults["tooltip"]["item-id"],
		shownPredicate	= isItemInfoExpanded
	})

	-- Maximum Stack Size
	local stackInitializer, stackSetting = AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_max-stack-size",
		variableName	= "max-stack-size",
		name			= L["options.tooltip.max-stack-size.name"],
		tooltip			= L["options.tooltip.max-stack-size.tooltip"],
		default			= defaults["tooltip"]["max-stack-size"],
		shownPredicate	= isItemInfoExpanded
	})

	-- Hide Non-stackable Items
	AWL.Settings:AddCheckbox(category, {
		variableTable	= EXT.Settings.tooltip,
		settingKey		= addonName .. "_hide-single-stack",
		variableName	= "hide-single-stack",
		name			= L["options.tooltip.hide-single-stack.name"],
		tooltip			= L["options.tooltip.hide-single-stack.tooltip"],
		default			= defaults["tooltip"]["hide-single-stack"],
		parentInit		= stackInitializer,
		parentCondition	= function() return stackSetting:GetValue() end,
		shownPredicate	= isItemInfoExpanded
	})

	-- Profiles Section
	AWL.Settings:AddProfilesSection(layout, {
		useAccountProfile			= Addon:IsAccountProfile(),
		onSwitchProfile				= function()
			Addon:ToggleProfileMode()
			ReloadUI()
		end,
		onDeleteCharacterProfiles	= function()
			Addon:ResetAllCharacterProfiles()
			ReloadUI()
		end
	})

	-- About Section
	AWL.Settings:AddAboutSection(layout, addonName, EXT.CHANGELOG)

	Settings.RegisterAddOnCategory(category)

	Addon:SetMainCategoryId(category:GetID())
end
