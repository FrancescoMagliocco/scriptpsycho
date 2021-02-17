-- luacheck: ignore Lua
local gamedataPerkArea = {}

local _gamedataPerkArea = Lua.ReadOnly{
    Lua.ReadOnly{ "Assault_Area_01", 0 },
    Lua.ReadOnly{ "Assault_Area_02", 1 },
    Lua.ReadOnly{ "Assault_Area_03", 2 },
    Lua.ReadOnly{ "Assault_Area_04", 3 },
    Lua.ReadOnly{ "Assault_Area_05", 4 },
    Lua.ReadOnly{ "Assault_Area_06", 5 },
    Lua.ReadOnly{ "Assault_Area_07", 6 },
    Lua.ReadOnly{ "Assault_Area_08", 7 },
    Lua.ReadOnly{ "Assault_Area_09", 8 },
    Lua.ReadOnly{ "Assault_Area_10", 9 },
    Lua.ReadOnly{ "Athletics_Area_01", 10 },
    Lua.ReadOnly{ "Athletics_Area_02", 11 },
    Lua.ReadOnly{ "Athletics_Area_03", 12 },
    Lua.ReadOnly{ "Athletics_Area_04", 13 },
    Lua.ReadOnly{ "Athletics_Area_05", 14 },
    Lua.ReadOnly{ "Athletics_Area_06", 15 },
    Lua.ReadOnly{ "Athletics_Area_07", 16 },
    Lua.ReadOnly{ "Athletics_Area_08", 17 },
    Lua.ReadOnly{ "Athletics_Area_09", 18 },
    Lua.ReadOnly{ "Athletics_Area_10", 19 },
    Lua.ReadOnly{ "Brawling_Area_01", 20 },
    Lua.ReadOnly{ "Brawling_Area_02", 21 },
    Lua.ReadOnly{ "Brawling_Area_03", 22 },
    Lua.ReadOnly{ "Brawling_Area_04", 23 },
    Lua.ReadOnly{ "Brawling_Area_05", 24 },
    Lua.ReadOnly{ "Brawling_Area_06", 25 },
    Lua.ReadOnly{ "Brawling_Area_07", 26 },
    Lua.ReadOnly{ "Brawling_Area_08", 27 },
    Lua.ReadOnly{ "ColdBlood_Area_01", 28 },
    Lua.ReadOnly{ "ColdBlood_Area_02", 29 },
    Lua.ReadOnly{ "ColdBlood_Area_03", 30 },
    Lua.ReadOnly{ "ColdBlood_Area_04", 31 },
    Lua.ReadOnly{ "ColdBlood_Area_05", 32 },
    Lua.ReadOnly{ "ColdBlood_Area_06", 33 },
    Lua.ReadOnly{ "ColdBlood_Area_07", 34 },
    Lua.ReadOnly{ "ColdBlood_Area_08", 35 },
    Lua.ReadOnly{ "ColdBlood_Area_09", 36 },
    Lua.ReadOnly{ "ColdBlood_Area_10", 37 },
    Lua.ReadOnly{ "CombatHacking_Area_01", 38 },
    Lua.ReadOnly{ "CombatHacking_Area_02", 39 },
    Lua.ReadOnly{ "CombatHacking_Area_03", 40 },
    Lua.ReadOnly{ "CombatHacking_Area_04", 41 },
    Lua.ReadOnly{ "CombatHacking_Area_05", 42 },
    Lua.ReadOnly{ "CombatHacking_Area_06", 43 },
    Lua.ReadOnly{ "CombatHacking_Area_07", 44 },
    Lua.ReadOnly{ "CombatHacking_Area_08", 45 },
    Lua.ReadOnly{ "CombatHacking_Area_09", 46 },
    Lua.ReadOnly{ "CombatHacking_Area_10", 47 },
    Lua.ReadOnly{ "Crafting_Area_01", 48 },
    Lua.ReadOnly{ "Crafting_Area_02", 49 },
    Lua.ReadOnly{ "Crafting_Area_03", 50 },
    Lua.ReadOnly{ "Crafting_Area_04", 51 },
    Lua.ReadOnly{ "Crafting_Area_05", 52 },
    Lua.ReadOnly{ "Crafting_Area_06", 53 },
    Lua.ReadOnly{ "Crafting_Area_07", 54 },
    Lua.ReadOnly{ "Crafting_Area_08", 55 },
    Lua.ReadOnly{ "Crafting_Area_09", 56 },
    Lua.ReadOnly{ "Crafting_Area_10", 57 },
    Lua.ReadOnly{ "Demolition_Area_01", 58 },
    Lua.ReadOnly{ "Demolition_Area_02", 59 },
    Lua.ReadOnly{ "Demolition_Area_03", 60 },
    Lua.ReadOnly{ "Demolition_Area_04", 61 },
    Lua.ReadOnly{ "Demolition_Area_05", 62 },
    Lua.ReadOnly{ "Demolition_Area_06", 63 },
    Lua.ReadOnly{ "Demolition_Area_07", 64 },
    Lua.ReadOnly{ "Demolition_Area_08", 65 },
    Lua.ReadOnly{ "Demolition_Area_09", 66 },
    Lua.ReadOnly{ "Demolition_Area_10", 67 },
    Lua.ReadOnly{ "Engineering_Area_01", 68 },
    Lua.ReadOnly{ "Engineering_Area_02", 69 },
    Lua.ReadOnly{ "Engineering_Area_03", 70 },
    Lua.ReadOnly{ "Engineering_Area_04", 71 },
    Lua.ReadOnly{ "Engineering_Area_05", 72 },
    Lua.ReadOnly{ "Engineering_Area_06", 73 },
    Lua.ReadOnly{ "Engineering_Area_07", 74 },
    Lua.ReadOnly{ "Engineering_Area_08", 75 },
    Lua.ReadOnly{ "Engineering_Area_09", 76 },
    Lua.ReadOnly{ "Engineering_Area_10", 77 },
    Lua.ReadOnly{ "Gunslinger_Area_01", 78 },
    Lua.ReadOnly{ "Gunslinger_Area_02", 79 },
    Lua.ReadOnly{ "Gunslinger_Area_03", 80 },
    Lua.ReadOnly{ "Gunslinger_Area_04", 81 },
    Lua.ReadOnly{ "Gunslinger_Area_05", 82 },
    Lua.ReadOnly{ "Gunslinger_Area_06", 83 },
    Lua.ReadOnly{ "Gunslinger_Area_07", 84 },
    Lua.ReadOnly{ "Gunslinger_Area_08", 85 },
    Lua.ReadOnly{ "Gunslinger_Area_09", 86 },
    Lua.ReadOnly{ "Gunslinger_Area_10", 87 },
    Lua.ReadOnly{ "Hacking_Area_01", 88 },
    Lua.ReadOnly{ "Hacking_Area_02", 89 },
    Lua.ReadOnly{ "Hacking_Area_03", 90 },
    Lua.ReadOnly{ "Hacking_Area_04", 91 },
    Lua.ReadOnly{ "Hacking_Area_05", 92 },
    Lua.ReadOnly{ "Hacking_Area_06", 93 },
    Lua.ReadOnly{ "Hacking_Area_07", 94 },
    Lua.ReadOnly{ "Hacking_Area_08", 95 },
    Lua.ReadOnly{ "Hacking_Area_09", 96 },
    Lua.ReadOnly{ "Hacking_Area_10", 97 },
    Lua.ReadOnly{ "Kenjutsu_Area_01", 98 },
    Lua.ReadOnly{ "Kenjutsu_Area_02", 99 },
    Lua.ReadOnly{ "Kenjutsu_Area_03", 100 },
    Lua.ReadOnly{ "Kenjutsu_Area_04", 101 },
    Lua.ReadOnly{ "Kenjutsu_Area_05", 102 },
    Lua.ReadOnly{ "Kenjutsu_Area_06", 103 },
    Lua.ReadOnly{ "Kenjutsu_Area_07", 104 },
    Lua.ReadOnly{ "Kenjutsu_Area_08", 105 },
    Lua.ReadOnly{ "Stealth_Area_01", 106 },
    Lua.ReadOnly{ "Stealth_Area_02", 107 },
    Lua.ReadOnly{ "Stealth_Area_03", 108 },
    Lua.ReadOnly{ "Stealth_Area_04", 109 },
    Lua.ReadOnly{ "Stealth_Area_05", 110 },
    Lua.ReadOnly{ "Stealth_Area_06", 111 },
    Lua.ReadOnly{ "Stealth_Area_07", 112 },
    Lua.ReadOnly{ "Stealth_Area_08", 113 },
    Lua.ReadOnly{ "Stealth_Area_09", 114 },
    Lua.ReadOnly{ "Stealth_Area_10", 115 }
}

function gamedataPerkArea.Get(perkAreaName)
    if not perkAreaName then
        print("gamedataPerkArea.Get():", "perkAreaName is nil")
        return
    end

    perkAreaName = perkAreaName:lower():gsub("%W", "")
    for _, perkAreaTable in ipairs(_gamedataPerkArea) do
        if perkAreaTable[1]:lower():gsub("%W", "") == perkAreaName then
            return perkAreaTable
        end
    end
end

function gamedataPerkArea.GetPerkAreaTableFromIndex(perkAreaIndex)
    perkAreaIndex = perkAreaIndex + 1
    if perkAreaIndex >= 1 and perkAreaIndex <= #_gamedataPerkArea then
        return _gamedataPerkArea[perkAreaIndex]
    end
end

function gamedataPerkArea.GetAll()
    return _gamedataPerkArea
end

return gamedataPerkArea
