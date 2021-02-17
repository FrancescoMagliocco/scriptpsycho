-- luacheck: ignore gamedataPerkType Perk Lua gamedataPerkArea Player
-- luacheck: ignore gamedataDevelopmentPointType
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
    return perk and perk:GetCurLevel()
end

function PlayerPerks.IncreasePerkLevel(perkName)
    local perk = CheckPerk("PlayerPerks.IncreasePerkLevel():", perkName)
    return perk and perk:IncreaseLevel()
end

function PlayerPerks.GetPerkMaxLevel(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkMaxLevel():", perkName)
    return perk and perk:GetMaxLevel()
end

function PlayerPerks.GetPerkIndex(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkIndex():", perkName)
    return perk and perk:GetIndex()
end

function PlayerPerks.GetPerkName(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkName():", perkName)
    return perk and perk:GetName()
end

function PlayerPerks.GetPerkRecord(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkRecord():", perkName)
    return perk and perk:GetRecord()
end

function PlayerPerks.GetPerkAreaIndexForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkAreaForPerk():", perkName)
    return perk and Perk.GetPerkAreaIndex(perk:GetPerkArea())
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
    return perk and perk:GetPerkAreaRecord()
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
    return perk and perk:UnlockPerkArea()
end

function PlayerPerks.UnlockPerkArea(perkArea)
    local perkAreaIndex = PlayerPerks.GetPerkAreaIndex(perkArea)
    if not perkAreaIndex then return end
    Player.GetDevData():UnlockPerkArea(perkAreaIndex)
    return true
end

function PlayerPerks.LockPerkAreaForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.LockPerkAreaForPerk():", perkName)
    return perk and perk:LockPerkArea()
end

function PlayerPerks.LockPerkArea(perkArea)
    local perkAreaIndex = PlayerPerks.GetPerkAreaIndex(perkArea)
    if not perkAreaIndex then return end
    Player.GetDevData():LockPerkArea(perkAreaIndex)
    return true
end

function PlayerPerks.HasPerk(perkName)
    local perk = CheckPerk("PlayerPerks.HasPerk():", perkName)
    -- We can't use the return approach similar to PlayerPerks.GetPerkMaxLevel()
    -- and PlayerPerks.GetPerkLevel() for the reason that perk:HasPerk() can
    -- return false if the player doesn't have the perk.  If we were to use the
    -- same approach, nil would be returned.
    if perk then return perk:HasPerk() end
end

function PlayerPerks.BuyPerk(perkName, giveDevPoint)
    local perk = CheckPerk("PlayerPerks.BuyPerk():", perkName)
    return perk and perk:BuyPerk(giveDevPoint)
end

function PlayerPerks.SetPerkLevel(perkName, level, giveDevPoints)
    if not level or level < 0 then
        print("PlayerPerks.SetPerkLevel():", "Level must be > 0")
        return
    end

    local perk = CheckPerk("PlayerPerks.SetPerkLevel():", perkName)
    if not perk or perk:GetMaxLevel() < level then
        print("PlayerPerks.SetPerkLevel():", level.." > Max level of "..perkName)
        return
    end

    -- We use perk current level a few times, so to reduce cpu cycles, we store
    -- it in memory
    local curLevel = perk:GetLevel()
    if curLevel == level then
        print("PlayerPerks.SetPerkLevel():", perkName.." is already level: "..level)
        return
    end

    if level < curLevel then
        -- Pretty sure this removes all levels of perk.  What confuses me
        -- though is in RemovePerk(),
        -- this.m_proficiencies[perk:GetIndex()].spentPerkPoints -= 1
        if not perk:RemovePerk() then
            print("PlayerPerks.SetPerkLevel():", "Failed to remove perk: "..perkName)
            return
        end

        -- No need to have the loop in two different locations
        goto buyperk
    end

    -- If perk can't be bought and the user doesn't want to be given dev points,
    if not perk:CanPerkBeBought() and not giveDevPoints then
        print("PlayerPerks.SetPerkLevel():", "No dev points to spend!")
        return
    end

    -- Modify level to be the amount of levels needed to reach level
    level = curLevel - level
    -- We are still checking if user wants to be given points because
    -- perk:CanPerkBeBought() might have returned true and giveDevPoints might
    -- have been false
    if giveDevPoints then
        Player.GetDevData():AddDevelopmentPoint(
            level, gamedataDevelopmentPointType.Primary)
    end

    -- Probably really frowned upon
    ::buyperk::
    for _ = 1, level do
        if not perk:BuyPerk() then
            print("PlayerPerks.SetPerkLevel():", "Failed to buy perk")
            return
        end
    end

    return true
end

function PlayerPerks.RemovePerk(perkName)
    local perk = CheckPerk("PlayerPerks.RemovePerk():", perkName)
    return perk and perk:RemovePerk()
end

function PlayerPerks.IsPerkUnlocked(perkName)
    local perk = CheckPerk("PlayerPerk.IsPerkUnlocked():", perkName)
    if perk then return perk:IsPerkAreaUnlocked() end
end

function PlayerPerks.RemoveAllPerks(areYouSure, areYouReallySure)
    if areYouSure ~= true and areYouReallySure ~= true then return end
    Player.GetDevData():RemoveAllPerks()
end

function PlayerPerks.init()
    for _, perkTable in ipairs(gamedataPerkType.GetAll()) do
        _Perks[perkTable[1]:lower():gsub("%W", "")] = Perk:new(perkTable)
    end

    _Perks = Lua.ReadOnly(_Perks)
    return true
end

return PlayerPerks
