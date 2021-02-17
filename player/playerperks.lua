-- luacheck: ignore gamedataPerkType Perk Lua
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

function PlayerPerks.GetPerkIndex(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkIndex():", perkName)
    return perk and perk:GetIndex() or nil
end

function PlayerPerks.GetPerkName(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkName():", perkName)
    return perk and perk:GetName() or nil
end

function PlayerPerks.GetPerkMaxLevel(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkMaxLevel():", perkName)
    return perk and perk:GetMaxLevel() or nil
end

function PlayerPerks.GetPerkLevel(perkName)
    local perk = CheckPerk("PlayerPerks.GetPerkLevel():", perkName)
    return perk and perk:GetCurLevel() or nil
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
