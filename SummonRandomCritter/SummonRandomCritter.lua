local inTaxiFlight = false
local outOfCombat = true

local function OnEvent(self, event, ...)
    if event == "PLAYER_REGEN_ENABLED" then
        outOfCombat = true
    elseif event == "PLAYER_REGEN_DISABLED" then
        outOfCombat = false
        return
    end

    if outOfCombat and event == "UNIT_AURA" and ... == "player" then
        local onTaxi = UnitOnTaxi("player")
        local wasOnTaxi = inTaxiFlight
        inTaxiFlight = (onTaxi == 1)

        if wasOnTaxi and not inTaxiFlight then
            SummonRandomCritter()
        end
    end

    if event == "PLAYER_ENTERING_WORLD" or event == "COMPANION_LEARNED" then
        if not IsMounted() and not inTaxiFlight then
            SummonRandomCritter()
        end
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMPANION_LEARNED")
f:RegisterEvent("UNIT_AURA")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:SetScript("OnEvent", OnEvent)
