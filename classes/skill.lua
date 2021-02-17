-- luacheck: ignore Player telemetryLevelGainReason
local Skill = { "", -1 }

-- Any function that checks if something is >= for the return statement, is also
-- a check to see if the interal called function has succeeded.  Some internal
-- functions, if something went wrong, -1 is returned.

function Skill:new(gamedataProfType)
    gamedataProfType = gamedataProfType or { "", -1 }
    setmetatable(gamedataProfType, self)
    self.__index = self
    return gamedataProfType
end

function Skill:GetCurLevel()
    local lvl = Player.GetDevData():GetProficiencyLevel(self[2])
    return lvl >= 0 and lvl or nil
end

-- I believe this returns the max level of the tied attribute
function Skill:GetMaxLevel()
    local lvl = Player.GetDevData():GetProficiencyMaxLevel(self[2])
    return lvl >= 0 and lvl or nil
end

function Skill:GetAbsoluteMaxLevel()
    local lvl = Player.GetDevData():GetProficiencyAbsoluteMaxLevel(self[2])
    return lvl >= 0 and lvl or nil
end

function Skill:GetCurLvlExp()
    local exp = Player.GetDevData():GetCurrentLevelProficiencyExp(self[2])
    return exp >= 0 and exp or nil
end

function Skill:GetTotalExp()
    local exp = Player.GetDevData():GetTotalProfExpierence(self[2])
    return exp >= 0 and exp or nil
end

function Skill:GetRemainingExpForLevelUp()
    local exp = Player.GetDevData():GetRemainingExpForLevelUp(self[2])
    return exp >= 0 and exp or nil
end

function Skill:GetExpForNextLevel()
    local exp = Player.GetDevData():GetExperienceForNextLevel(self[2])
    return exp >= 0 and exp or nil
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
function Skill:SetLevel(skillLvl, levelGainReason)
    if not skillLvl >= 0 or skillLvl > self:GetMaxLevel() then return end
    Player.GetDevData():SetLevel(
        self[2],skillLvl, levelGainReason or telemetryLevelGainReason.Ignore)
    return true
end

-- Sets this.m_proficiencies[self[3]].currentLevel to this.m_startingLevel
-- Sets this.m_proficiencies[self[3]].currentExp to this.m_startingExperience
-- Calls this.RemoveProficiencyStat(self[3])
-- Calls this.AddProficiencyStat(self[3], this.m_startingLevel)
function Skill:ResetLevel(areYouSure)
    if not areYouSure then return end
    Player.GetDevData():ResetProficiencyLevel(self[2])
    return true
end

function Skill.GetProfIndexFromType(profType)
    if not profType then return end
    local profIndex = Player.GetDevData():GetProficiencyIndexByType(profType)
    return profIndex >= 0 and profIndex or nil
end

function Skill.GetDominatingProf()
    return Player.GetDevData():GetDominatingProficiency()
end

return Skill
