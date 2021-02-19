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

-- If skillName is a valid Skill, the corresponding Skill be returned.  If
-- skillName is not a valid Skills, nil will be returned.
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

-- If skillName is a valid Skill, the max level of Skill skillName is returned.
-- If skillName is not a valid Skill, nil is returned.
--
-- The max skill level in most cases is not the actual highest level a Skill can
-- be, but the level of which Attribute a Skill is tied to.  The level of a
-- Skill can not be higher than the Attribute the Skill is tied to.
function PlayerSkills.GetSkillMaxLevel(skillName)
    local skill = CheckSkill("PlayerSkills.GetSkillMaxLevel():", skillName)
    return skill and skill:GetMaxLevel() or nil
end

-- If skillName is a valid Skill, the current level of Skill skillName is
-- returned.  If skillName is not a valid skill, nil is returned.
function PlayerSkills.GetSkillLevel(skillName)
    local skill = CheckSkill("PlayerSkills.GetSkillLevel():", skillName)
    return skill and skill:GetCurLevel() or nil
end

-- Sets the level of Skill skillName to level.  Level must be >= 0 and <= to the
-- max level Skill skillName can be.  If skillName is not a valid Skill, nil is
-- returned.  If level is < 0 or > the max level of Skill skillName, nil is
-- returned.  If all goes well, true is returned.
-- XXX TODO Include more information for this documentation
--
-- If levelGainReason is not specified, telemetryLevelGainReason.Ignore is used.
-- XXX TODO Include documentation of levelGainReason
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

-- Returns the Skill that is of the highest level.
function PlayerSkills.GetDominatingSkill()
    return PlayerSkills.GetSkillFromIndex(
        Skill.GetProfIndexFromType(Skill.GetDominatingProf()))
end

-- The reason why we are doing the amount check for exp instead of in function
-- Skill:AddExp() like we do for level in Skill:SetLevel() is we might create a
-- function to remove exp using Skill:AddExp().  If we do the amount check for
-- exp in Skill:AddExp(), we wont be able to provide a negative amount to
-- Skill:AddExp()
function PlayerSkills.AddSkillExp(amount, skillName, levelGainReason)
    if not amount or amount <= 0 then
        print("PlayerSkills.AddSkillExp():", "Amount must be provided and be > 0")
        return
    end

    local skill = CheckSkill("PlayerSkills.AddSkillExp():", skillName)
    if skill and skill:AddExp(
            amount,
            telemetryLevelGainReason.Get(levelGainReason)
                or telemetryLevelGainReason.Ignore) then return true end

    print("PlayerSkills.AddSkillExp():", skillName, "unsucessful")
end

function PlayerSkills.init()
    for _, skillTable in ipairs(gamedataProficiencyType.GetAll()) do
        _Skills[skillTable[1]:lower():gsub("%W", "")] = Skill:new(skillTable)
    end

    _Skills = Lua.ReadOnly(_Skills)
    return true
end

return PlayerSkills
