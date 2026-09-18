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

function Utils:IsAccountProfile()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	return Expositum_Options_v4.profileKeys[characterGUID]["use-account"]
end

function Utils:OpenSettingsOnLoading()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	if Expositum_Options_v4.profileKeys[characterGUID]["open-settings"] then
		if not self:OpenSettings() then
			return
		end

		Expositum_Options_v4.profileKeys[characterGUID]["open-settings"] = false
	end
end

function Utils:ToggleProfileMode()
	local characterGUID = AWL.Utils:GetCharacterGUID()
	local useAccountProfile = self:IsAccountProfile()

	Expositum_Options_v4.profileKeys[characterGUID]["use-account"] = not useAccountProfile
	Expositum_Options_v4.profileKeys[characterGUID]["open-settings"] = true
end

function Utils:ResetAllCharacterProfiles()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	Expositum_Options_v4.profiles = {}
	Expositum_Options_v4.profileKeys = {}

	Expositum_Options_v4.profileKeys[characterGUID] = {
		["use-account"] = true,
		["open-settings"] = true
	}
end

function Utils:InitializeDatabase()
	local characterGUID = AWL.Utils:GetCharacterGUID()

	if not characterGUID then
		return nil
	end

	local createdProfile = false
	local createdProfileKey = false

	local defaults = {
		["general"] = {
			["minimap-button"] = {
				["hide"] = false
			}
		},
		["tooltip"] = {}
	}

	if not Expositum_Options_v4 then
		Expositum_Options_v4 = {
			["account"] = AWL.Utils:CopyTable(defaults),
			["profiles"] = {},
			["profileKeys"] = {}
		}
	end

	if not Expositum_Options_v4.profiles[characterGUID] then
		Expositum_Options_v4.profiles[characterGUID] = AWL.Utils:CopyTable(defaults)
		createdProfile = true
	end

	if not Expositum_Options_v4.profileKeys[characterGUID] then
		Expositum_Options_v4.profileKeys[characterGUID] = {
			["use-account"] = true,
			["open-settings"] = false
		}
		createdProfileKey = true
	end

	local useAccountProfile = Expositum_Options_v4.profileKeys[characterGUID]["use-account"]

	if useAccountProfile then
		EXT.Settings.general = Expositum_Options_v4.account["general"]
		EXT.Settings.tooltip = Expositum_Options_v4.account["tooltip"]
	else
		EXT.Settings.general = Expositum_Options_v4.profiles[characterGUID]["general"]
		EXT.Settings.tooltip = Expositum_Options_v4.profiles[characterGUID]["tooltip"]
	end

	return {
		characterGUID = characterGUID,
		createdProfile = createdProfile,
		createdProfileKey = createdProfileKey,
		activeProfile = useAccountProfile and "account" or "character"
	}
end

function Utils:InitializeMinimapButton()
	self.minimapButton = Addon:RegisterMinimapButton({
		db = EXT.Settings.general["minimap-button"],
		tooltip = L["minimap-button.tooltip"]
	})
end
