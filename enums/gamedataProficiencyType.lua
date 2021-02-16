local gamedataProficiencyType = {}

local _gamedataProfType = {
    { "Assault", 0 },
    { "Athletics", 1 },
    { "Brawling", 2 },
    { "ColdBlood", 3 },
    { "CombatHacking", 4 },
    { "Crafting", 5 },
    { "Demolition", 6 },
    { "Engineering", 7 },
    { "Gunslinger", 8 },
    { "Hacking", 9 },
    { "Kenjutsu", 10 },
    { "Level", 11 },
    { "StreetCred", 12 }
}

function gamedataProficiencyType.Get(profName)
    for _, profTable in ipairs(_gamedataProfType) do
        if profTable[1]:lower():gsub("%W", "")
                == profName:lower():gsub("%W", "") then
            return profTable
        end
    end
end

-- Specify index as zero based.
function gamedataProficiencyType.GetProfTableFromIndex(profIndex)
    profIndex = profIndex + 1
    if profIndex >= 1 and profIndex <= #_gamedataProfType then
        return _gamedataProfType[profIndex]
    end
end

function gamedataProficiencyType.GetAll()
    return _gamedataProfType
end

return gamedataProficiencyType
