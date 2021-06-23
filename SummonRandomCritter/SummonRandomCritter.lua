local function OnEvent(self, event, ...)
	local mounted = IsMounted()
	if mounted == nil then SummonRandomCritter() end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMPANION_LEARNED")
f:SetScript("OnEvent", OnEvent)