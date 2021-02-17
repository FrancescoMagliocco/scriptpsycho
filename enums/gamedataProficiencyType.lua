-- luacheck: ignore Lua
local gamedataProficiencyType = {}

local _gamedataProfType = Lua.ReadOnly{
    Lua.ReadOnly{ "Assault", 0 },
    Lua.ReadOnly{ "Athletics", 1 },
    Lua.ReadOnly{ "Brawling", 2 },
    Lua.ReadOnly{ "ColdBlood", 3 },
    Lua.ReadOnly{ "CombatHacking", 4 },
    Lua.ReadOnly{ "Crafting", 5 },
    Lua.ReadOnly{ "Demolition", 6 },
    Lua.ReadOnly{ "Engineering", 7 },
    Lua.ReadOnly{ "Gunslinger", 8 },
    Lua.ReadOnly{ "Hacking", 9 },
    Lua.ReadOnly{ "Kenjutsu", 10 },
    Lua.ReadOnly{ "Level", 11 },
    Lua.ReadOnly{ "StreetCred", 12 }
}

function gamedataProficiencyType.Get(profName)
    if not profName then
        print("gamedataProficiencyType.Get():", "profName is nil")
        return
    end

    profName = profName:lower():gsub("%W", "")
    for _, profTable in ipairs(_gamedataProfType) do
        if profTable[1]:lower():gsub("%W", "") == profName then
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
