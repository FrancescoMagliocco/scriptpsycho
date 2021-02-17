-- luacheck: ignore gamedataPerkType Perk Lua gamedataPerkArea Player
local PlayerPerks = {}

local _Perks = nil

-- if perkName is not a valid perk, nil will be returned.
local CheckPerk = function(funcName, perkName)
    local perk = PlayerPerks.Get(perkName)
    if not perk then
        print(funcName, perkName.." is not a valid perk.")
        return
    end

    return perk
end

function PlayerPerks.Get(perkName)
    return _Perks[perkName:lower():gsub("%W", "")]
end

function PlayerPerks.GetPerkFromIndex(perkIndex)
    local perkTable = gamedataPerkType.GetPerkTableFromIndex(perkIndex)

    if not perkTable then
        print("PlayerPerks.GetPerkFromIndex():", "Couldn't get perk from index")
        return
    end

    return CheckPerk("PlayerPerks.GetPerkFromIndex():", perkTable[1])
end

function PlayerPerks.GetPerkLevel(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkLevel():", perkName)
    return perk and perk:GetCurLevel() or nil
end

function PlayerPerks.IncreasePerkLevel(perkName)
    local perk = CheckPerk("PlayerPerks.IncreasePerkLevel():", perkName)
    return perk and perk:IncreaseLevel() or nil
end

function PlayerPerks.GetPerkMaxLevel(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkMaxLevel():", perkName)
    return perk and perk:GetMaxLevel() or nil
end

function PlayerPerks.GetPerkIndex(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkIndex():", perkName)
    return perk and perk:GetIndex() or nil
end

function PlayerPerks.GetPerkName(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkName():", perkName)
    return perk and perk:GetName() or nil
end

function PlayerPerks.GetPerkRecord(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkRecord():", perkName)
    return perk and perk:GetRecord() or nil
end

function PlayerPerks.GetPerkAreaIndexForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkAreaForPerk():", perkName)
    return perk and Perk.GetPerkAreaIndex(perk:GetPerkArea()) or nil
end

function PlayerPerks.GetPerkAreaIndex(perkArea)
    local perkAreaTable = gamedataPerkArea.Get(perkArea)
    if not perkAreaTable then
        print("PlayerPerks.GetPerkArea():", perkArea.." is not a valid perkArea")
        return
    end

    return perkAreaTable[2]
end

function PlayerPerks.GetPerkAreaRecordForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkAreaRecordForPerk():", perkName)
    return perk and perk:GetPerkAreaRecord() or nil
end

-- I feel like this should be in the class perk...  But then again at the
-- sametime, I think this is in the correct spot..
function PlayerPerks.GetPerkAreaRecord(perkArea)
    local perkAreaIndex = PlayerPerks.GetPerkAreaIndex(perkArea)
    -- Maybe display message... Even though PlayerPerks.GetPerkAreaIndex() would
    -- have displayed a message if perkArea was not a valid perkArea?..
    if not perkAreaIndex then return end
    return Player.GetDevData():GetPerkAreaRecord(perkAreaIndex)
end

function PlayerPerks.UnlockPerkAreaForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.UnlockPerkAreaForPerk():", perkName)
    return perk and perk:UnlockPerkArea() or nil
end

function PlayerPerks.HasPerk(perkName)
    local perk = CheckPerk("PlayerPerks.HasPerk():", perkName)
    -- We can't use the return approach similar to PlayerPerks.GetPerkMaxLevel()
    -- and PlayerPerks.GetPerkLevel() for the reason that perk:HasPerk() can
    -- return false if the player doesn't have the perk.  If we were to use the
    -- same approach, nil would be returned.
    if perk then return perk:HasPerk() end
end

function PlayerPerks.IsPerkUnlocked(perkName)
    local perk = CheckPerk("PlayerPerk.IsPerkUnlocked():", perkName)
    if perk then return perk:IsPerkAreaUnlocked() end
end

-- TODO Need to add function to buy perk

function PlayerPerks.init()
    for _, perkTable in ipairs(gamedataPerkType.GetAll()) do
        _Perks[perkTable[1]:lower():gsub("%W", "")] = Perk:new(perkTable)
    end

    _Perks = Lua.ReadOnly(_Perks)
    return true
end

return PlayerPerks
