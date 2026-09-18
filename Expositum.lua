local addonName, EXT = ...

-- Library
local AWL = ArcaneWizardLibrary

-- Module imports
local Options = EXT.Modules.Options
local Tooltip = EXT.Modules.Tooltip
local Utils = EXT.Modules.Utils

-- Variables
local isInitialized = false

--------------
--- Frames ---
--------------

local ExpositumFrame = CreateFrame("Frame", "Expositum")

-----------------------
--- Local Functions ---
-----------------------

local function SlashCommand(msg)
	if not isInitialized then return end

	local command = strtrim(msg or "")

	if command == "" then
		Utils:OpenSettings()
	elseif command == "changelog" then
		AWL.Frames:OpenChangelog(addonName, EXT.CHANGELOG)
	else
		Utils:PrintDebug("No arguments will be accepted.")
	end
end

------------------------
--- Public Functions ---
------------------------

function ExpositumFrame:OnEvent(event, ...)
	self[event](self, event, ...)
end

function ExpositumFrame:ADDON_LOADED(_, addOnName)
	if addOnName ~= addonName or isInitialized then return end

	local dbInit = Utils:InitializeDatabase()

	if not dbInit then
		AWL:GetAddon(addonName):AbortInitialization(self)
		return
	end

	Utils:InitializeMinimapButton()
	Options:Initialize()

	Tooltip:Initialize()

	Utils:OpenSettingsOnLoading()

	isInitialized = true

	Utils:PrintDebug(string.format(
		"InitializeDatabase: key=%s, createdProfile=%s, createdProfileKey=%s, activeProfile=%s",
		tostring(dbInit.characterGUID), tostring(dbInit.createdProfile), tostring(dbInit.createdProfileKey), tostring(dbInit.activeProfile)
	))
	Utils:PrintDebug("Addon fully loaded.")
end

ExpositumFrame:RegisterEvent("ADDON_LOADED")
ExpositumFrame:SetScript("OnEvent", ExpositumFrame.OnEvent)

SLASH_Expositum1, SLASH_Expositum2 = '/ext', '/expositum'

SlashCmdList["Expositum"] = SlashCommand
