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
	
	addon:RawHook(addon, "CreateBagSlotPanel", function(this, ...)
		local bPanel = addon.hooks[this].CreateBagSlotPanel(this, ...)
			bPanel:SetTemplate("Transparent")
			if IsAddOnLoaded("ElvUI_KlixUI") or IsAddOnLoaded("ElvUI_MerathilisUI") then
				bPanel:Styling()
			end
			for _, v in pairs(bPanel.buttons) do
				AS:SkinIconButton(v)
			end
			return bPanel
		end,
	true)

	addon:RegisterMessage("AdiBags_UpdateButton", function(event, btn)
		AS:SkinIconButton(btn)
		if IsAddOnLoaded("ElvUI_KlixUI") then
			ElvUI_KlixUI[1]:GetModule("KuiButtonStyle"):StyleButton(btn)
		end
		if btn.IconQuestTexture:GetBlendMode() == "ADD" then
			btn:SetBackdropBorderColor(btn.IconQuestTexture:GetVertexColor())
			btn.IconQuestTexture:Hide()
		else
			btn.IconQuestTexture:Show()
		end
	end)
	
end