local addonName, addon = ...
local L = addon.L

local E, _, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")

function addon:MakeAdiBagsPretty(event)

	if not AddOnSkins then
		E:Print("Please enable AddOnSkins to get the full ElvUI look of AdiBags!!")
		return
	end
	
	local AS = unpack(AddOnSkins)

	addon:RegisterMessage("AdiBags_UpdateButton", function(event, btn)
		AS:SkinIconButton(btn)
		if IsAddOnLoaded("ElvUI_KlixUI") then
			ElvUI_KlixUI[1]:GetModule("KuiButtonStyle"):StyleButton(btn)
		end
	end)
	
end