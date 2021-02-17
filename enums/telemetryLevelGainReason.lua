-- luacheck: ignore Lua
local telemetryLevelGainReason = {}

local _telemetryLevelGainReason = Lua.ReadOnly{
    Lua.ReadOnly{ "Ignore", 0 },
    Lua.ReadOnly{ "Gameplay", 1 },
    Lua.ReadOnly{ "IsDebug", 2 }
}

function telemetryLevelGainReason.Get(levelGainReasonName)
    if not levelGainReasonName then
        print("telemetryLevelGainReason.Get():", "levelGainReasonName is nil")
        return
    end

    levelGainReasonName = levelGainReasonName:lower():gsub("%W", "")
    for _, levelGainReasonTable in ipairs(_telemetryLevelGainReason) do
        if levelGainReasonTable[1]:lower():gsub("%W", "") == levelGainReasonName then
            return levelGainReasonTable
        end
    end
end

-- Specify index as zero based.
function telemetryLevelGainReason.GetLevelGainReasonTableFromIndex(
        levelGainReasonIndex)
    levelGainReasonIndex = levelGainReasonIndex + 1
    if levelGainReasonIndex >= 1
            and levelGainReasonIndex <= #_telemetryLevelGainReason then
        return _telemetryLevelGainReason[levelGainReasonIndex]
    end
end

function telemetryLevelGainReason.GetAll()
    return _telemetryLevelGainReason
end

-- I'm thinking about implementing something like this in all of the other enums
-- as well
telemetryLevelGainReason.Ignore     = _telemetryLevelGainReason[1][2]
telemetryLevelGainReason.Gameplay   = _telemetryLevelGainReason[2][2]
telemetryLevelGainReason.IsDebug    = _telemetryLevelGainReason[3][2]

-- This needs to be tested.  My idea here is the fields are readonly
return Lua.ReadOnly(telemetryLevelGainReason)
