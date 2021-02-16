-- luacheck: ignore Game Player gamedataStatType
local StatsSys = {}

function StatsSys.GetStatsSystem()
    return Game.GetStatsSystem()
end

-- returns a table of gameStatDetailedData
--[[
    public native struct gameStatDetailedData {
        public native let statType: gamedataStatType;
        public native let limitMin: Float;
        public native let limitMax: Float;
        public native let value: Float;
        public native let modifiers: array<gameStatModifierDetailedData>;
        public native let boolStatType: Bool;
    }
--]]
function StatsSys.GetStatDetailedData()
    return StatsSys.GetStatsSystem():GetStatDetails(Player.GetPlayerID())
end

function StatsSys.GetStatDetailsForStat(statName)
    local statTable = gamedataStatType.Get(statName)
    if not statTable then return end

    -- Is there any difference from having statType be declared in this scope,
    -- instead of the for loop scope?  Wont this way be a bit more optimized?
    local statType = nil
    -- We are iterating 'GetStatDetails()' incause the returned table don't
    -- contain all possible stats.
    for _, statDetailedData in ipairs(StatsSys.GetStatDetailedData()) do
        -- statDetailedData.statType is type userdata.  To use string
        -- functions, we must convert to string.
        statType = tostring(statDetailedData.statType)
        -- For some reason, if we don't convert to number, this will never
        -- be true, even though statType is a number in a string.
        -- gamedataStatType : statName (number)
        if tonumber(statType:sub(statType:find("%(") + 1, -2))
                == statTable[2] then
            return statDetailedData
        end
    end
end

-- We are converting the returnined values tonumber to avoid any issues that may
-- occure like in StatsSys.GetStatDetailsForStat()
function StatsSys.GetStatLimitMin(statName)
    local statDetailedData = StatsSys.GetStatDetailsForStat(statName)
    return statDetailedData and tonumber(statDetailedData.limitMin) or nil
end

function StatsSys.GetStatLimitMax(statName)
    local statDetailedData = StatsSys.GetStatDetailsForStat(statName)
    return statDetailedData and tonumber(statDetailedData.limitMax) or nil
end

function StatsSys.GetStatValue(statName)
    local statDetailedData = StatsSys.GetStatDetailsForStat(statName)
    return statDetailedData and tonumber(statDetailedData.value) or nil
end

function StatsSys.ModStat(statName, value)
    local statTable = gamedataStatType.Get(statName)
    if statTable then
        Game.ModStatPlayer(statTable[1], value)
    end
end

return StatsSys
