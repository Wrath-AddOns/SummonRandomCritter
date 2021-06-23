local function OnEvent(self, event, ...)
	SummonRandomCritter()
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMPANION_LEARNED")
f:SetScript("OnEvent", OnEvent)