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

-- perkName is always converted to lowercase, then stirpped down of any
-- character that isn't alphanumeric.  You could specify "CoLDBLoD", "C O l d b
-- l ood", "C_O_LD     BLOOD" and the mod will still understand that you are
-- refering to the Perk "ColdBlood"

-- Returns a Perk of name perkName.  If no perk exists with perkName, nil is
-- returned.
function PlayerPerks.Get(perkName)
    return _Perks[perkName:lower():gsub("%W", "")]
end

-- Returns a Perk that is represented internally by perkIndex.  If no Perk is
-- represented by perkIndex internally, nil is returned.
--
-- perkIndex is zero based.
function PlayerPerks.GetPerkFromIndex(perkIndex)
    local perkTable = gamedataPerkType.GetPerkTableFromIndex(perkIndex)

    if not perkTable then
        print("PlayerPerks.GetPerkFromIndex():", "Couldn't get perk from index")
        return
    end

    return CheckPerk("PlayerPerks.GetPerkFromIndex():", perkTable[1])
end

-- If perkName is a valid perk, current level of perkName is returned.  If no
-- perk exists for perkName, nil is returned.
function PlayerPerks.GetPerkLevel(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkLevel():", perkName)
    return perk and perk:GetCurLevel()
end

-- If perkName is a valid perk, the level of perkName is increased.  It is not
-- recommended to use this function to increase the level of a perk.  There are
-- certain packages that are applied per Perk.  If you want to increase the
-- level of a Perk, PlayerPerks.BuyPerk(perkName) will do exactly that and add
-- any packages that come along with the Perk.
function PlayerPerks.IncreasePerkLevel(perkName)
    local perk = CheckPerk("PlayerPerks.IncreasePerkLevel():", perkName)
    return perk and perk:IncreaseLevel()
end

-- If perkName is a valid Perk, returns the max level of Perk perkName. If
-- perkName is not a valid Perk, nil is returned.
function PlayerPerks.GetPerkMaxLevel(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkMaxLevel():", perkName)
    return perk and perk:GetMaxLevel()
end

-- If perkName is a valid Perk, the internal index of Perk is returned.  If
-- perkName is not a valid Perk, nil is returned.
--
-- The index that is returned is unlike how Lua handles index; it is zero based.
-- Most if not all functions in this mod, when asked for some type of index,
-- index is zero based.  If there is a function that is not zero based, you can
-- simply increment the index by one.
function PlayerPerks.GetPerkIndex(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkIndex():", perkName)
    return perk and perk:GetIndex()
end

-- If perkName is a valid Perk, the name of Perk will be returned.
function PlayerPerks.GetPerkName(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkName():", perkName)
    return perk and perk:GetName()
end

-- If perkName is a valid Perk, the reocrd for Perk perkName is returned.  If
-- perkName is not a valid Perk, nil is returned.
function PlayerPerks.GetPerkRecord(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkRecord():", perkName)
    return perk and perk:GetRecord()
end

-- If perkName is a valid Perk, the internal index of the PerkArea Perk perkName
-- resides in is returned.  If perkName is not a valid Perk, nil is returned.
function PlayerPerks.GetPerkAreaIndexForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkAreaForPerk():", perkName)
    return perk and Perk.GetPerkAreaIndex(perk:GetPerkArea())
end

-- If perkAreaName is a valid PerkArea, the internal index of PerkArea
-- perkAreaName is returned.  If perkAreaName is not a valid PerkArea, nil is
-- returned.
function PlayerPerks.GetPerkAreaIndex(perkAreaName)
    local perkAreaTable = gamedataPerkArea.Get(perkAreaName)
    if not perkAreaTable then
        print("PlayerPerks.GetPerkArea():", perkAreaName.." is not a valid perkArea")
        return
    end

    return perkAreaTable[2]
end

-- If perkName is a valid Perk, the Record for PerkArea Perk perkName resides in
-- is returned.  If perkName is not a valid Perk, nil is returned.
function PlayerPerks.GetPerkAreaRecordForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkAreaRecordForPerk():", perkName)
    return perk and perk:GetPerkAreaRecord()
end


-- If perkAreaName is a valid PerkArea, the internal index of PerkArea
-- perkAreaName is returned.  If perkAreaName is not a valid PerkArea, nil is
-- returned.
--
-- I feel like this should be in the class perk...  But then again at the
-- sametime, I think this is in the correct spot..
function PlayerPerks.GetPerkAreaRecord(perkAreaName)
    local perkAreaIndex = PlayerPerks.GetPerkAreaIndex(perkAreaName)
    -- Maybe display message... Even though PlayerPerks.GetPerkAreaIndex() would
    -- have displayed a message if perkArea was not a valid perkArea?..
    if not perkAreaIndex then return end
    return Player.GetDevData():GetPerkAreaRecord(perkAreaIndex)
end

-- If perkName is a valid Perk, the PerkArea for which Perk perkName resides in
-- will be unlocked and true will be returned.  If perkName is not a valid Perk,
-- either nil or false is returned.
--
-- TODO Check if nil or false is returend
--
-- XXX Not sure if this actually works and if the requirments of the specific
-- PerkArea still need to be met.
-- XXX Does UnlockPerkArea() actually return anything?
function PlayerPerks.UnlockPerkAreaForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.UnlockPerkAreaForPerk():", perkName)
    return perk and perk:UnlockPerkArea()
end

-- If perkAreaName is a valid PerkArea, PerkArea perkAreaName will be unlocked
-- and true will be returned.  If perkAreaName is not a valid PerkArea nil is
-- returned. will be returned.
--
-- XXX Not sure if this actually works and if the requirments of PerkArea
-- perkArea still need to be met.
--
-- We are using the internal functions to unlock a PerkArea, so we are returning
-- true here unlike how in PlayerPerks.UnlockPerkAreaForPerk(), the returned
-- value was the outcome of perk and perk:UnlockPerkArea()
function PlayerPerks.UnlockPerkArea(perkAreaName)
    local perkAreaIndex = PlayerPerks.GetPerkAreaIndex(perkAreaName)
    if not perkAreaIndex then return end
    Player.GetDevData():UnlockPerkArea(perkAreaIndex)
    return true
end

-- If perkName is a valid Perk, the PerkArea for which Perk perkName resides in
-- will be locked and true will be returned.  If perkName is not a valid Perk,
-- either false or nil is returned.
function PlayerPerks.LockPerkAreaForPerk(perkName)
    local perk = CheckPerk("PlayerPerks.LockPerkAreaForPerk():", perkName)
    return perk and perk:LockPerkArea()
end

-- If perkAreaName is a valid PerkArea, PerkArea perkAreaName will be locked
-- and true will be returned.  If perkAreaName is not a valid PerkArea,
-- either nil is returned.
--
-- XXX Not sure if this actually works and if the requirements of PerkArea
-- perkArea still need to be met.
function PlayerPerks.LockPerkArea(perkAreaName)
    local perkAreaIndex = PlayerPerks.GetPerkAreaIndex(perkAreaName)
    if not perkAreaIndex then return end
    Player.GetDevData():LockPerkArea(perkAreaIndex)
    return true
end

-- If perkName is a valid Perk, true or false is returned depending on if Player
-- has Perk perkName.  If perkName is not a valid Perk, nil is retured.
function PlayerPerks.HasPerk(perkName)
    local perk = CheckPerk("PlayerPerks.HasPerk():", perkName)
    -- We can't use the return approach similar to PlayerPerks.GetPerkMaxLevel()
    -- and PlayerPerks.GetPerkLevel() for the reason that perk:HasPerk() can
    -- return false if the player doesn't have the perk.  If we were to use the
    -- same approach, nil would be returned.
    if perk then return perk:HasPerk() end
end

-- Given that perkName is a valid Perk and the following conditions are met:
--  - PerkArea Perk perkName resides in is unlocked
--  - Current level of Perk perkName isn't already max
--  - Player has atleast one Primary Development Point or giveDevPoint is true
-- If the above condtions are met and Player doesn't already have Perk perkName,
-- Perk perkName will be added to Player.  If Player already has Perk perkName,
-- the level of Perk perkName will be increased.  If a Perk was either added or
-- had its level raised and giveDevPoint was not true, one Primary Development
-- Point will be deducted.  If giveDevPoint is true, no Primary Development
-- Points will be deducted.  After completion of adding or increaseing the level
-- of Perk perkName and no error happend, true will be returned.  If an issues
-- happend, false will be returned.  If perkName is not a valid Perk, nil will
-- be returned.
--
-- XXX TODO Explain what giveDevPoint does
function PlayerPerks.BuyPerk(perkName, giveDevPoint)
    local perk = CheckPerk("PlayerPerks.BuyPerk():", perkName)
    return perk and perk:BuyPerk(giveDevPoint)
end

-- TODO Add check to see if level is actually a number
-- Given that perkName is a valid Perk and the following conditions are met:
--  - level is not nil and not less than 0
--  - Current level of Perk perkName is not already level
--  - Current level of Perk perkName is < max level of Perk perkName
-- If just one of the above conditions are not met, nil is returned.
-- If all above condtions are met, if level is less than Perk perkName current
-- level, Player should get back currenPerkLevel - level in Primary Development
-- Points.  If there was no issue in modifying the level of Perk perkName, true
-- is returned, otherwise nil is returned.
--
-- If level is greater than Perk perkName current level and Player either has at
-- least level - currentPerkLevel in Primary Development Points if giveDevPoints
-- is not true, true will be returned and if giveDevPoints was not true, level -
-- currentPerlLevel in Primary Development Points will be deducted.  If
-- giveDevPoints was true, no Primary Development Points will be deducted.  If
-- Player doesn't have enough Primary Development Points and giveDevPoints is
-- not true, nil will be retured.
--
-- XXX TODO Revise this documentation
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

    -- XXX If Player doesn't have Perk perkName, is 0 returned for the level?
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

-- If perkName is a valid Perk, upon successful removeal of Perk perkName, true
-- will be returned and Player should be rembursed by the correct amount of
-- Primary Development Points.
--
-- I'm pretty sure that this will remove Perk perkName entirely, not just lower
-- the level of Perk perkName.
--
-- If any issues occures or if perkName is not a valid Perk, nil is returned.
function PlayerPerks.RemovePerk(perkName)
    local perk = CheckPerk("PlayerPerks.RemovePerk():", perkName)
    return perk and perk:RemovePerk()
end

-- If perkName is a valid Perk, true will be returned if the PerkArea Perk
-- perkName resides in.  Otherwise false is returned.  If perkName is not a
-- valid Perk, nil is returned.
--
-- TODO Revise documentaion a bit
function PlayerPerks.IsPerkUnlocked(perkName)
    local perk = CheckPerk("PlayerPerk.IsPerkUnlocked():", perkName)
    if perk then return perk:IsPerkAreaUnlocked() end
end

-- TODO Maybe return true after Removeal of all Perks?
-- Removes ALL Perks from Player.  Both areYouSure and areYouReallySure must be
-- boolean true; not a number, not a string.  Only excepted value is true
--
-- If either of the two parameters are not true, nil will be returned, nil will
-- still be returned even after all Perk's have been removed.
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
