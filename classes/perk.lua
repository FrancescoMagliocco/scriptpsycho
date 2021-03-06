-- luacheck: ignore
local Perk = { "", "", -1 }

function Perk:new(gamedataPerkType)
    gamedataPerkType = gamedataPerkType or { "", "", -1 }
    setmetatable(gamedataPerkType, self)
    self.__index = self
    return gamedataPerkType
end

function Perk:GetCurLevel()
    return Player.GetDevData():GetPerkLevel(self[3])
end

function Perk:IncreaseLevel()
    Player.GetDevData():IncreasePerkLevel(
        Perk.GetPerkAreaIndex(self:GetPerkArea(), self[3]))
    return true
end

function Perk:GetMaxLevel()
    return Player.GetDevData():GetPerkMaxLevel(self[3])
end

function Perk:GetIndex()
    return self[3]
end

function Perk:GetName()
    return self[1]
end

function Perk:GetRecord()
    return Player.GetDevData():GetPerkRecord(self[3])
end

function Perk:GetPerkArea()
    return Player.GetDevData():GetPerkAreaFromPerk(self[3])
end

function Perk:GetPerkAreaRecord()
    return Player.GetDevData():GetPerkAreaRecord(self:GetPerkArea())
end

function Perk:UnlockPerkArea()
    Player.GetDevData():UnlockPerkArea(self:GetPerkArea())
    return true
end

function Perk:LockPerkArea()
    Player.GetDevData():LockPerkArea(self:GetPerkArea())
    return true
end

-- Becaseu there is two signatures for interal 'GetPerkPackageTDBID()', we may
-- need to use the parameters that of the first signature if prevalence matters.
function Perk:GetPerkPackageTDBID()
    return Player.GetDevData():GetPerkPackageTDBID(self[3])
end

function Perk:GetPerkRecord()
    return Player.GetDevData():GetPerkRecord(self[3])
end

function Perk:HasPerk()
    return Player.GetDevData():HasPerk(self[3])
end

function Perk:BuyPerk(giveDevPoint)
    if self:GetCurLevel() >= self:GetMaxLevel()
            or not giveDevPoint
            and not self:CanPerkBeBought() then
        return
    end

    if giveDevPoint then
        Player.GetDevData():AddDevelopmentPoint(1, gamedataDevelopmentPointType.Primary)
    end

    return Player.GetDevData():BuyPerk(self[3])
end

function Perk:RemovePerk()
    return Player.GetDevData():RemovePerk(self[3])
end

-- returns false if PerkMaxLevel < Perk current level or if Player has no Perk
-- Dev Points
function Perk:CanPerkBeBought()
    return Player:GetDevData():CanPerkBeBought(self[3])
end

function Perk:IsPerkAreaUnlocked()
    return Player:GetDevData():IsPerkAreaUnlocked(self:GetPerkArea())
end

function Perk:GetProfFromPerkArea()
    return Player.GetDevData():GetProficiencyFromPerkArea(self:GetPerkArea())
end

function Perk.GetPerkAreaIndex(perkArea)
    if not perkArea then return end
    local perkAreaIndex = Player.GetDevData():GetPerkAreaIndex(perkArea)
    return perkAreaIndex >= 0 and perkAreaIndex or nil
end

-- TODO Need to add function to buy perk

return Perk
