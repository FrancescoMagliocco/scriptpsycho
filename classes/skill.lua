-- luacheck: ignore Player
local Skill = { "", -1 }

function Skill:new(gamedataProfType)
    gamedataProfType = gamedataProfType or { "", -1 }
    setmetatable(gamedataProfType, self)
    self.__index = self
    return gamedataProfType
end

function Skill:GetCurLevel()
    local lvl = Player.GetDevData():GetProficiencyLevel(self[2])
    return lvl > 0 and lvl or nil
end

-- I believe this returns the max level of the tied attribute
function Skill:GetMaxLevel()
    local lvl = Player.GetDevData():GetProficiencyMaxLevel(self[2])
    return lvl > 0 and lvl or nil
end

function Skill:GetAbsoluteMaxLevel()
    local lvl = Player.GetDevData():GetProficiencyAbsoluteMaxLevel(self[2])
    return lvl > 0 and lvl or nil
end

function Skill:GetCurLvlExp()
    local exp = Player.GetDevData():GetCurrentLevelProficiencyExp(self[2])
    return exp > 0 and exp or nil
end

function Skill:GetTotalExp()
    local exp = Player.GetDevData():GetTotalProfExpierence(self[2])
    return exp > 0 and exp or nil
end

function Skill:GetRemainingExpForLevelUp()
    local exp = Player.GetDevData():GetRemainingExpForLevelUp(self[2])
    return exp > 0 and exp or nil
end

function Skill:GetExpForNextLevel()
    local exp = Player.GetDevData():GetExperienceForNextLevel(self[2])
    return exp > 0 and exp or nil
end

function Skill:GetProfRecord()
    return Player.GetDevData():GetProficiencyRecordByIndex(self[2])
end

-- TODO Once PlayerAttribs have been finished, be sure to implement getting
-- Attribute tied to Proficiency

-- Check to see if this works
-- EnumName() should be the attribute name
function Skill:GetAttRecord()
    return self:GetProfRecord():TiedAttribute()
end

function Skill:GetIndex()
    return self[2]
end

function Skill:GetName()
    return self[1]
end

-- TODO Return message describing issue to caller; caller can decide whether
-- or not to display message.  If no issue, return nil
-- XXX Make sure that when implemented, that all calling functions have been
-- updated to understand what is returned
function Skill:SetLevel(skillLvl)
    if not skillLvl >= 0 or skillLvl > self:GetMaxLevel() then return nil end
    Player.GetDevData():SetLevel(self[2], skillLvl)
    return true
end

return Skill
