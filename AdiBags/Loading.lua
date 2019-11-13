local name, addon = ...
local f = CreateFrame("Frame")
local login = true

local function eventhandler(self, event, arg1, ...)
    if(login and ((event == "ADDON_LOADED" and name == arg1) or (event == "PLAYER_LOGIN") or (event == "PLAYER_ENTERING_WORLD"))) then
        if not IsAddOnLoaded('ElvUI') and not IsAddOnLoaded('KlixUI') then
			StaticPopup_Show("COMPATIBILITY")
		end
		login = nil
        f:UnregisterEvent("ADDON_LOADED")
        f:UnregisterEvent("PLAYER_LOGIN")
		f:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", eventhandler)

StaticPopupDialogs.COMPATIBILITY = {
	text = "You don't have have |cfffe7b2cElvUI|r or |cfff960d9KlixUI|r enabled. Please select an addon to enable.",
	OnAccept = function() EnableAddOn("ElvUI"); ReloadUI() end,
	OnCancel = function() EnableAddOn("KlixUI"); ReloadUI() end,
	button1 = "|cfffe7b2cElvUI|r",
	button2 = "|cfff960d9KlixUI|r",
	button3 = "Disable AdiBags",
	OnAlt = function() DisableAddOn("AdiBags"); ReloadUI() end,
	whileDead = 1,
	hideOnEscape = false
}