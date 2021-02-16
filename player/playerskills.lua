-- luacheck: ignore PlayerSkills Skill Player gamedataProficiencyType
PlayerSkills = {}

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

function PlayerSkills.SetSkillLevel(skillName, level)
    local skill = CheckSkill("PlayerSkills.SetSkillLevel():", skillName)
    if skill and skill:SetLevel(level) then return true end

    print("PlayerSkills.SetSkillLevel():", skillName, "unsuccessful")
end

function PlayerSkills.init()
    for _, skillTable in ipairs(gamedataProficiencyType.GetAll()) do
        _Skills[skillTable[1]:lower():gsub("%W", "")] = Skill:new(skillTable)
    end

    return true
end

return PlayerSkills
