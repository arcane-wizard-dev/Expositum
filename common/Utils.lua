local addonName, EXT = ...

-- Library
local AWL = ArcaneWizardLibrary
local Addon = AWL:GetAddon(addonName)

-- Localization
local L = EXT.Localization

-- Current module
local Utils = EXT.Modules.Utils

-----------------------
--- Local Functions ---
-----------------------

local function PrintChatMessage(color, prefix, msg)
	DEFAULT_CHAT_FRAME:AddMessage(color:WrapTextInColorCode(prefix .. ": ") .. tostring(msg))
end

------------------------
--- Module Functions ---
------------------------

function Utils:PrintMessage(msg)
	PrintChatMessage(NORMAL_FONT_COLOR, addonName, msg)
end

function Utils:PrintDebug(msg)
	if EXT.Settings.general["debug-mode"] then
		PrintChatMessage(ORANGE_FONT_COLOR, addonName .. " (Debug)", msg)
	end
end

function Utils:OpenSettings()
	if not Addon:OpenCategory() then
		self:PrintDebug("In combat. The options menu cannot be opened.")
		return false
	end

	return true
end

function Utils:InitializeDatabase()
	local dbInit = Addon:InitializeOptions({
		databaseName = "Expositum_Options_v4",
		defaults = EXT.OPTIONS_DEFAULTS,
		onOpenSettings = function()
			return self:OpenSettings()
		end
	})

	if not dbInit then
		return nil
	end

	EXT.Settings.global = dbInit.global
	EXT.Settings.general = dbInit.settings["general"]
	EXT.Settings.tooltip = dbInit.settings["tooltip"]

	return dbInit
end

function Utils:InitializeMinimapButton()
	self.minimapButton = Addon:RegisterMinimapButton({
		db = EXT.Settings.general["minimap-button"],
		tooltip = L["minimap-button.tooltip"]
	})
end
