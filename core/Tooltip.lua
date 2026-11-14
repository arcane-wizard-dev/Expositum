local addonName, EXT = ...

if EXT.State and EXT.State.libraryIncompatible then return end

-- Library
local AWL = ArcaneWizardLibrary

-- Localization
local L = EXT.Localization

-- Current module
local Tooltip = EXT.Modules.Tooltip

-- Module imports
local TooltipConfig = EXT.UIConfig.Tooltip
local Utils = EXT.Modules.Utils

-- Variables
local tooltipLineStates = setmetatable({}, {__mode = "k"})
local tooltipResetHooks = setmetatable({}, {__mode = "k"})

-----------------------
--- Local Functions ---
-----------------------

local function ResetTooltipLineState(tooltip)
	tooltipLineStates[tooltip] = nil
end

local function EnsureTooltipResetHook(tooltip)
	if tooltipResetHooks[tooltip] or not tooltip.HookScript then return end

	tooltip:HookScript("OnTooltipCleared", ResetTooltipLineState)
	tooltipResetHooks[tooltip] = true
end

local function GetItemID(itemLink)
	if C_Item and C_Item.GetItemInfoInstant then
		local itemID = C_Item.GetItemInfoInstant(itemLink)

		if itemID then
			return itemID
		end
	end

	if type(itemLink) == "string" then
		return tonumber(itemLink:match("item:(%d+)"))
	end

	return nil
end

local function GetTooltipLineState(tooltip, itemLink)
	EnsureTooltipResetHook(tooltip)

	local state = tooltipLineStates[tooltip]

	if not state or state.itemLink ~= itemLink then
		state = {itemLink = itemLink, lineKeys = {}}
		tooltipLineStates[tooltip] = state
	end

	return state
end

local function AddItemLine(tooltip, state, key, value)
	local blankLinePosition = EXT.Settings.tooltip["blank-line-position"]

	if not state.hasItemLines and (blankLinePosition == "top" or blankLinePosition == "both") then
		tooltip:AddLine(" ")
	end

	local label = L["tooltip." .. key]

	if EXT.Settings.tooltip["layout"] == "left" then
		tooltip:AddLine(label .. ": " .. value, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true)
	else
		tooltip:AddDoubleLine(label, value)
	end

	state.lineKeys[key] = true
	state.hasItemLines = true
end

local function IsTooltipAvailable(tooltip)
	return tooltip and not (tooltip.IsForbidden and tooltip:IsForbidden())
end

local function WhiteText(value)
	return "|cnWHITE_FONT_COLOR:" .. value .. "|r"
end

local function GetExpansionText(expansionID, expansionName)
	local expansionText = WhiteText(expansionName)
	local displayMode = EXT.Settings.tooltip["expansion-display"]

	if displayMode == "name" then
		return expansionText
	end

	local expansionBadge = TooltipConfig.expansionBadges[expansionID]

	if expansionBadge and expansionBadge.texture then
		local badgeText = ("|T%s:16:32|t"):format(expansionBadge.texture)

		if displayMode == "badge" then
			return badgeText
		end

		return badgeText .. " " .. expansionText
	end

	return expansionText
end

local function GetCategoryText(itemType, itemSubType)
	if itemSubType and itemSubType ~= "" and itemSubType ~= itemType then
		return itemType .. " (" .. itemSubType .. ")"
	end

	return itemType
end

local function GetRarityText(itemQuality)
	if itemQuality == nil then
		return nil
	end

	local qualityName = _G["ITEM_QUALITY" .. itemQuality .. "_DESC"]

	if not qualityName then
		return nil
	end

	local qualityColor = ITEM_QUALITY_COLORS and ITEM_QUALITY_COLORS[itemQuality]

	if qualityColor and type(qualityColor.hex) == "string" then
		local colorCode = qualityColor.hex

		if colorCode:sub(1, 2) ~= "|c" then
			colorCode = "|c" .. colorCode
		end

		return colorCode .. qualityName .. "|r"
	end

	return WhiteText(qualityName)
end

------------------------
--- Module Functions ---
------------------------

function Tooltip:Initialize()
	if AWL.GAME_TYPE_CLASSIC or AWL.GAME_TYPE_TBC or AWL.GAME_TYPE_MISTS then
		local function OnTooltipSetItem(tooltip)
			if not IsTooltipAvailable(tooltip) then return end

			local _, link = tooltip:GetItem()

			if link then
				self:ProcessTooltip(tooltip, link)
			end
		end

		GameTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
		ItemRefTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)

		if ShoppingTooltip1 then
			ShoppingTooltip1:HookScript("OnTooltipSetItem", OnTooltipSetItem)
		end

		if ShoppingTooltip2 then
			ShoppingTooltip2:HookScript("OnTooltipSetItem", OnTooltipSetItem)
		end
	elseif AWL.GAME_TYPE_RETAIL or AWL.GAME_TYPE_FOREVER then
		TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, data)
			if not IsTooltipAvailable(tooltip) or not data then return end

			local link = (data.hyperlink or data.link)

			if not link and data.guid and C_Item.GetItemLinkByGUID then
				link = C_Item.GetItemLinkByGUID(data.guid)
			end

			if not link and data.id then
				link = ("item:%d"):format(data.id)
			end

			if link then
				self:ProcessTooltip(tooltip, link)
			end
		end)
	else
		Utils:PrintDebug("Unsupported game type.")
	end
end

function Tooltip:ProcessTooltip(tooltip, itemLink)
	if not itemLink then return end

	local lineState = GetTooltipLineState(tooltip, itemLink)
	local lineKeys = lineState.lineKeys
	local settings = EXT.Settings.tooltip
	local needsExpansion = AWL.GAME_TYPE_RETAIL and settings["expansion"] and not lineKeys["expansion"]
	local needsCategory = settings["category"] and not lineKeys["category"]
	local needsRarity = settings["rarity"] and not lineKeys["rarity"]
	local needsItemLevel = settings["item-level"] and not lineKeys["item-level"]
	local needsItemID = settings["item-id"] and not lineKeys["item-id"]
	local needsMaxStackSize = settings["max-stack-size"] and not lineKeys["max-stack-size"]
		and not (settings["hide-single-stack"] and lineState.maxStackSize == 1)

	local needsItemInfo = needsExpansion or needsCategory or needsRarity or needsItemLevel or needsMaxStackSize

	if not (needsItemInfo or needsItemID) then return end

	local itemName, _, itemQuality, itemLevel, _, itemType, itemSubType, maxStackSize, _, _, _, _, _, _, expansionID = C_Item.GetItemInfo(itemLink)
	lineState.maxStackSize = maxStackSize

	if needsExpansion then
		local expansionName = EXT.EXPANSION_NAMES[expansionID]

		if expansionName then
			AddItemLine(tooltip, lineState, "expansion", GetExpansionText(expansionID, expansionName))
		end
	end

	if needsCategory and itemType ~= nil then
		AddItemLine(tooltip, lineState, "category", WhiteText(GetCategoryText(itemType, itemSubType)))
	end

	if needsRarity then
		local rarityText = GetRarityText(itemQuality)

		if rarityText then
			AddItemLine(tooltip, lineState, "rarity", rarityText)
		end
	end

	if needsItemLevel and itemLevel ~= nil then
		AddItemLine(tooltip, lineState, "item-level", WhiteText(itemLevel))
	end

	if needsItemID then
		local itemID = GetItemID(itemLink)

		if itemID ~= nil then
			AddItemLine(tooltip, lineState, "item-id", WhiteText(itemID))
		end
	end

	if needsMaxStackSize
		and type(maxStackSize) == "number"
		and maxStackSize >= 1
		and (not settings["hide-single-stack"] or maxStackSize > 1)
	then
		AddItemLine(tooltip, lineState, "max-stack-size", WhiteText(BreakUpLargeNumbers(maxStackSize)))
	end

	local blankLinePosition = settings["blank-line-position"]

	if lineState.hasItemLines
		and not lineState.hasTrailingBlankLine
		and (blankLinePosition == "bottom" or blankLinePosition == "both")
		and (itemName ~= nil or not needsItemInfo)
	then
		tooltip:AddLine(" ")
		lineState.hasTrailingBlankLine = true
	end
end
