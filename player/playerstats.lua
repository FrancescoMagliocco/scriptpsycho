-- luacheck: ignore Stats gamedataStatType
local PlayerStats   = {}

local CheckStat = function(funcName, statName)
    if not statName or statName == "" then
        print(funcName, "statName must be specified.")
        return
    end

    local statTable = gamedataStatType.Get(statName)
    if not statTable then
        print(funcName, statName, "is not a valid stat.")
        return
    end

    return statTable
end

local CheckStatAndValue = function(funcName, statName, value)
    if not value or value < 0 then
        print(funcName, "value must be specified and  be >= 0")
        return
    end

    return CheckStat(funcName, statName)
end

-- Returns the current value of stat statName, give that statName is a valid
-- Stat.  If statName is not a valid Stat, nil is returned.
function PlayerStats.GetStat(statName)
    if not CheckStat("PlayerStats.GetStat()", statName) then return end

    local statValue = Stats.GetStatValue(statName)
    if statValue == nil then
        print("PlayerStats.GetStat():", statName.." was nil")
    end

    return statValue
end

-- Checks if value is within the min and max range that is allowed for Stat
-- statName, given that Stat statName is a valid Stat.  If statName is not a
-- valid Stat, nil is returned.
--
-- We are not doing a check for statName as we are using this function in other
-- functions, and we don't want a message to be displayed more than once.
--
-- The check on statName and value are the responsibility of the caller
function PlayerStats.ValueWithinRange(statName, value)
    local statMin   = Stats.GetStatLimitMin(statName)
    -- If statMin is nil, there is no need to check if statMax is nil as odds
    -- are if statMin is nil, it is because statName is not a valid Stat.
    if not statMin then return end
    local statMax   = Stats.GetStatLimitMax(statName)
    return statMin <= value and statMax >= value, statMin, statMax
end

-- XXX TODO FIXME Because we are checking if a value is within the range a
-- particular stat is valid for, the Value check in CheckStatAndValue may not be
-- needed as some stats allow for negative values to be their value.
function PlayerStats.ModStat(statName, value)
    -- TODO We could just use this function to determine if statName is a valid
    -- stat, or we could created a dedicated function.
    --
    -- If we do create a dedicated fucntion, it should be probably be placed
    -- inside 'statssystem'
    if not CheckStatAndValue("PlayerStats.ModStat():", statName, value) then
        return
    end

    local inRange, statMin, statMax = PlayerStats.ValueWithinRange(statName, value)
    if not inRange then
        print("PlayerStats.ModStat():", value.." not within range: min: "
            ..statMin.." max: "..statMax.." for: "..statName)
        return
    end

    Stats.ModStat(statName, value)
end

return PlayerStats
