-- luacheck: ignore Skill Player gamedataProficiencyType Lua
-- luacheck: ignore telemetryLevelGainReason
local PlayerSkills = {}

local _Skills = nil

local CheckSkill = function(funcName, skillName)
    local skill = PlayerSkills.Get(skillName)
    if not skill then
        print(funcName, skillName, "is not a valid skill")
        return
    end

    return skill
end

function PlayerSkills.Get(skillName)
    return  _Skills[skillName:lower():gsub("%W", "")]
end

function PlayerSkills.GetSkillFromIndex(skillIndex)
    local skillTable = gamedataProficiencyType.GetProfTableFromIndex(skillIndex)

    if not skillTable then
        print("PlayerSkills.Get():", "Couldn't get skill from index")
        return
    end

    return CheckSkill("PlayerSkills.GetSkillFromIndex():", skillTable[1])
end

function PlayerSkills.GetSkillMaxLevel(skillName)
    local skill = CheckSkill("PlayerSkills.GetSkillMaxLevel():", skillName)
    return skill and skill:GetMaxLevel() or nil
end

function PlayerSkills.GetSkillLevel(skillName)
    local skill = CheckSkill("PlayerSkills.GetSkillLevel():", skillName)
    return skill and skill:GetCurLevel() or nil
end

function PlayerSkills.SetSkillLevel(skillName, level, levelGainReason)
    local skill = CheckSkill("PlayerSkills.SetSkillLevel():", skillName)
    if skill and skill:SetLevel(
            level,
            telemetryLevelGainReason.Get(levelGainReason)
                or telemetryLevelGainReason.Ignore) then return true end

    print("PlayerSkills.SetSkillLevel():", skillName, "unsuccessful")
end

-- To make sure that the user wants to reset the level for skillName, areYouSure
-- and areYouReallySure must be true
function PlayerSkills.ResetSkillLevel(skillName, areYouSure, areYouReallySure)
    if areYouSure ~= true and areYouReallySure ~= true then return end
    local skill = CheckSkill("PlayerSkills.ResetSkillLevel():", skillName)
    return skill and skill:ResetLevel(true) or nil
end

function PlayerSkills.init()
    for _, skillTable in ipairs(gamedataProficiencyType.GetAll()) do
        _Skills[skillTable[1]:lower():gsub("%W", "")] = Skill:new(skillTable)
    end

    _Skills = Lua.ReadOnly(_Skills)
    return true
end

return PlayerSkills
