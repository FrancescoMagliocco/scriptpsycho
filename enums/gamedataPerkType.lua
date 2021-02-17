-- luacheck: ignore Lua
local gamedataPerkType = {}

local _gamedataPerkType = Lua.ReadOnly{
    Lua.ReadOnly{ "bulletjock", "Assault_Area_01_Perk_1", 0 },
    Lua.ReadOnly{ "eagleeye", "Assault_Area_01_Perk_2", 1 },
    Lua.ReadOnly{ "coveringkillshot", "Assault_Area_02_Perk_1", 2 },
    Lua.ReadOnly{ "toocloseforcomfort", "Assault_Area_02_Perk_2", 3 },
    Lua.ReadOnly{ "bullseye", "Assault_Area_03_Perk_1", 4 },
    Lua.ReadOnly{ "executioner", "Assault_Area_03_Perk_2", 5 },
    Lua.ReadOnly{ "shootreloadrepeat", "Assault_Area_04_Perk_1", 6 },
    Lua.ReadOnly{ "duckhunter", "Assault_Area_04_Perk_2", 7 },
    Lua.ReadOnly{ "nervesofsteel", "Assault_Area_05_Perk_1", 8 },
    Lua.ReadOnly{ "feeltheflow", "Assault_Area_05_Perk_2", 9 },
    Lua.ReadOnly{ "trenchwarfare", "Assault_Area_06_Perk_1", 10 },
    Lua.ReadOnly{ "huntershands", "Assault_Area_06_Perk_2", 11 },
    Lua.ReadOnly{ "skullskipper", "Assault_Area_07_Perk_1", 12 },
    Lua.ReadOnly{ "namedbullets", "Assault_Area_07_Perk_2", 13 },
    Lua.ReadOnly{ "bunker", "Assault_Area_08_Perk_1", 14 },
    Lua.ReadOnly{ "recoilwrangler", "Assault_Area_08_Perk_2", 15 },
    Lua.ReadOnly{ "inperspective", "Assault_Area_09_Perk_1", 16 },
    Lua.ReadOnly{ "longshot", "Assault_Area_09_Perk_2", 17 },
    Lua.ReadOnly{ "savagestoic", "Assault_Area_10_Perk_1", 18 },

    Lua.ReadOnly{ "regeneration", "Athletics_Area_01_Perk_1", 19 },
    Lua.ReadOnly{ "packmule", "Athletics_Area_01_Perk_2", 20 },
    Lua.ReadOnly{ "invincible", "Athletics_Area_02_Perk_1", 21 },
    Lua.ReadOnly{ "truegrit", "Athletics_Area_02_Perk_2", 22 },
    Lua.ReadOnly{ "epimorphosis", "Athletics_Area_03_Perk_1", 23 },
    Lua.ReadOnly{ "softonyourfeet", "Athletics_Area_03_Perk_2", 24 },
    Lua.ReadOnly{ "steelandchrome", "Athletics_Area_04_Perk_1", 25 },
    Lua.ReadOnly{ "gladiator", "Athletics_Area_04_Perk_2", 26 },
    Lua.ReadOnly{ "dividedandattention", "Athletics_Area_05_Perk_1", 27 },
    Lua.ReadOnly{ "multitasker", "Athletics_Area_05_Perk_2", 28 },
    Lua.ReadOnly{ "likeabutterfly", "Athletics_Area_05_Perk_3", 29 },
    Lua.ReadOnly{ "transporter", "Athletics_Area_06_Perk_1", 30 },
    Lua.ReadOnly{ "strongertogether", "Athletics_Area_06_Perk_2", 31 },
    Lua.ReadOnly{ "cardiocure", "Athletics_Area_06_Perk_3", 32 },
    Lua.ReadOnly{ "humanshield", "Athletics_Area_07_Perk_1", 33 },
    Lua.ReadOnly{ "marathoner", "Athletics_Area_07_Perk_2", 34 },
    Lua.ReadOnly{ "dogofwar", "Athletics_Area_08_Perk_1", 35 },
    Lua.ReadOnly{ "wolverine", "Athletics_Area_08_Perk_2", 36 },
    Lua.ReadOnly{ "steelshell", "Athletics_Area_09_Perk_1", 37 },
    Lua.ReadOnly{ "therock", "Athletics_Area_10_Perk_1", 38 },
    Lua.ReadOnly{ "indestructable", "Athletics_Area_10_Perk_2", 39 },

    Lua.ReadOnly{ "flurry", "Brawling_Area_01_Perk_1", 40 },
    Lua.ReadOnly{ "crushingblows", "Brawling_Area_01_Perk_2", 41 },
    Lua.ReadOnly{ "juggernaut", "Brawling_Area_02_Perk_1", 42 },
    Lua.ReadOnly{ "dazed", "Brawling_Area_02_Perk_2", 43 },
    Lua.ReadOnly{ "rush", "Brawling_Area_03_Perk_1", 44 },
    Lua.ReadOnly{ "efficientblows", "Brawling_Area_03_Perk_2", 45 },
    Lua.ReadOnly{ "humanfortress", "Brawling_Area_04_Perk_1", 46 },
    Lua.ReadOnly{ "opportunestrike", "Brawling_Area_04_Perk_2", 47 },
    Lua.ReadOnly{ "payback", "Brawling_Area_05_Perk_1", 48 },
    Lua.ReadOnly{ "reinvigorate", "Brawling_Area_05_Perk_2", 49 },
    Lua.ReadOnly{ "breathingspace", "Brawling_Area_06_Perk_1", 50 },
    Lua.ReadOnly{ "relentless", "Brawling_Area_06_Perk_2", 51 },
    Lua.ReadOnly{ "frenzy", "Brawling_Area_07_Perk_1", 52 },
    Lua.ReadOnly{ "thrash", "Brawling_Area_07_Perk_2", 53 },
    Lua.ReadOnly{ "bidingtime", "Brawling_Area_08_Perk_1", 54 },
    Lua.ReadOnly{ "unshakable", "Brawling_Area_08_Perk_2", 55 },

    Lua.ReadOnly{ "coldblood", "ColdBlood_Area_01_Perk_1", 56 },
    Lua.ReadOnly{ "willtosurvive", "ColdBlood_Area_02_Perk_1", 57 },
    Lua.ReadOnly{ "icyveins", "ColdBlood_Area_02_Perk_2", 58 },
    Lua.ReadOnly{ "criticalconditoin", "ColdBlood_Area_03_Perk_1", 59 },
    Lua.ReadOnly{ "frostysynapses", "ColdBlood_Area_03_Perk_2", 60 },
    Lua.ReadOnly{ "defensiveclothing", "ColdBlood_Area_04_Perk_1", 61 },
    Lua.ReadOnly{ "rapidbloodflow", "ColdBlood_Area_04_Perk_2", 62 },
    Lua.ReadOnly{ "coldestblood", "ColdBlood_Area_05_Perk_1", 63 },
    Lua.ReadOnly{ "frozenprecision", "ColdBlood_Area_05_Perk_2", 64 },
    Lua.ReadOnly{ "predator", "ColdBlood_Area_06_Perk_1", 65 },
    Lua.ReadOnly{ "bloodbrawl", "ColdBlood_Area_06_Perk_2", 66 },
    Lua.ReadOnly{ "quicktransfer", "ColdBlood_Area_06_Perk_3", 67 },
    Lua.ReadOnly{ "bloodswell", "ColdBlood_Area_07_Perk_1", 68 },
    Lua.ReadOnly{ "coldandcalculating", "ColdBlood_Area_07_Perk_2", 69 },
    Lua.ReadOnly{ "coolagulant", "ColdBlood_Area_08_Perk_1", 70 },
    Lua.ReadOnly{ "unbreakable", "ColdBlood_Area_08_Perk_2", 71 },
    Lua.ReadOnly{ "painisanillusion", "ColdBlood_Area_09_Perk_1", 72 },
    Lua.ReadOnly{ "immunity", "ColdBlood_Area_10_Perk_1", 73 },

    Lua.ReadOnly{ "biosynergy", "CombatHacking_Area_01_Perk_1", 74 },
    Lua.ReadOnly{ "bloodware", "CombatHacking_Area_01_Perk_2", 75 },
    Lua.ReadOnly{ "forgetmenot", "CombatHacking_Area_02_Perk_1", 76 },
    Lua.ReadOnly{ "ispy", "CombatHacking_Area_02_Perk_2", 77 },
    Lua.ReadOnly{ "hackersmanual", "CombatHacking_Area_02_Perk_3", 78 },
    Lua.ReadOnly{ "daisychain", "CombatHacking_Area_03_Perk_1", 79 },
    Lua.ReadOnly{ "weaklink", "CombatHacking_Area_03_Perk_2", 80 },
    Lua.ReadOnly{ "signalsupport", "CombatHacking_Area_04_Perk_1", 81 },
    Lua.ReadOnly{ "subliminalmessage", "CombatHacking_Area_05_Perk_1", 82 },
    Lua.ReadOnly{ "mnemonic", "CombatHacking_Area_06_Perk_1", 83 },
    Lua.ReadOnly{ "diffusion", "CombatHacking_Area_06_Perk_2", 84 },
    Lua.ReadOnly{ "schoolofhardhacks", "CombatHacking_Area_06_Perk_3", 85 },
    Lua.ReadOnly{ "plague", "CombatHacking_Area_07_Perk_1", 86 },
    Lua.ReadOnly{ "criticalerror", "CombatHacking_Area_08_Perk_1", 87 },
    Lua.ReadOnly{ "hackeroverlord", "CombatHacking_Area_08_Perk_2", 88 },
    Lua.ReadOnly{ "anamnesis", "CombatHacking_Area_09_Perk_1", 89 },
    Lua.ReadOnly{ "optimization", "CombatHacking_Area_10_Perk_1", 90 },
    Lua.ReadOnly{ "bartmosslegacy", "CombatHacking_Area_10_Perk_2", 91 },

    Lua.ReadOnly{ "mechanic", "Crafting_Area_01_Perk_1", 92 },
    -- Not used
    Lua.ReadOnly{ "", "Crafting_Area_01_Perk_2", 93 },
    Lua.ReadOnly{ "truecraftsman", "Crafting_Area_02_Perk_1", 94 },
    Lua.ReadOnly{ "scrapper", "Crafting_Area_02_Perk_2", 95 },
    Lua.ReadOnly{ "workshop", "Crafting_Area_03_Perk_1", 96 },
    Lua.ReadOnly{ "innovation", "Crafting_Area_04_Perk_1", 97 },
    Lua.ReadOnly{ "sapper", "Crafting_Area_04_Perk_2", 98 },
    Lua.ReadOnly{ "fieldtechnical", "Crafting_Area_05_Perk_1", 99 },
    Lua.ReadOnly{ "200efficiency", "Crafting_Area_05_Perk_2", 100 },
    Lua.ReadOnly{ "exnihilo", "Crafting_Area_06_Perk_1", 101 },
    Lua.ReadOnly{ "efficientupgrade", "Crafting_Area_06_Perk_2", 102 },
    Lua.ReadOnly{ "greasemonkey", "Crafting_Area_06_Perk_3", 103 },
    Lua.ReadOnly{ "costoptimization", "Crafting_Area_07_Perk_1", 104 },
    Lua.ReadOnly{ "lettherebelight", "Crafting_Area_07_Perk_2", 105 },
    Lua.ReadOnly{ "wastenotwantnot", "Crafting_Area_08_Perk_1", 106 },
    Lua.ReadOnly{ "tuneup", "Crafting_Area_08_Perk_2", 107 },
    Lua.ReadOnly{ "edgerunnerartisan", "Crafting_Area_09_Perk_1", 108 },
    Lua.ReadOnly{ "cuttingedge", "Crafting_Area_10_Perk_1", 109 },

    Lua.ReadOnly{ "hailsofbullets", "Demolition_Area_01_Perk_1", 110 },
    Lua.ReadOnly{ "pumpitlouder", "Demolition_Area_02_Perk_1", 111 },
    Lua.ReadOnly{ "inyourface", "Demolition_Area_02_Perk_2", 112 },
    Lua.ReadOnly{ "bloodrush", "Demolition_Area_03_Perk_1", 113 },
    Lua.ReadOnly{ "deadcenter", "Demolition_Area_03_Perk_2", 114 },
    Lua.ReadOnly{ "bulldozer", "Demolition_Area_04_Perk_1", 115 },
    Lua.ReadOnly{ "mongoose", "Demolition_Area_04_Perk_2", 116 },
    Lua.ReadOnly{ "momentumshift", "Demolition_Area_05_Perk_1", 117 },
    Lua.ReadOnly{ "massacre", "Demolition_Area_05_Perk_2", 118 },
    Lua.ReadOnly{ "skeetshooter", "Demolition_Area_06_Perk_1", 119 },
    Lua.ReadOnly{ "heavyload", "Demolition_Area_06_Perk_2", 120 },
    Lua.ReadOnly{ "unstopabble", "Demolition_Area_07_Perk_1", 121 },
    Lua.ReadOnly{ "manic", "Demolition_Area_07_Perk_2", 122 },
    Lua.ReadOnly{ "speeddemon", "Demolition_Area_08_Perk_1", 123 },
    Lua.ReadOnly{ "burnbabyburn", "Demolition_Area_08_Perk_2", 124 },
    Lua.ReadOnly{ "hitthedeck", "Demolition_Area_09_Perk_1", 125 },
    Lua.ReadOnly{ "poppinoff", "Demolition_Area_09_Perk_2", 126 },
    Lua.ReadOnly{ "biathlete", "Demolition_Area_10_Perk_1", 127 },
    -- Not used
    Lua.ReadOnly{ "", "Demolition_Area_10_Perk_2", 128 },

    Lua.ReadOnly{ "mechlooter", "Engineering_Area_01_Perk_1", 129 },
    Lua.ReadOnly{ "blastshielding", "Engineering_Area_01_Perk_2", 130 },
    Lua.ReadOnly{ "canttouchthis", "Engineering_Area_02_Perk_1", 131 },
    Lua.ReadOnly{ "grenadier", "Engineering_Area_02_Perk_2", 132 },
    Lua.ReadOnly{ "shrapnel", "Engineering_Area_03_Perk_1", 133 },
    Lua.ReadOnly{ "bladerunner", "Engineering_Area_04_Perk_1", 134 },
    Lua.ReadOnly{ "upto11", "Engineering_Area_04_Perk_2", 135 },
    Lua.ReadOnly{ "lockandload", "Engineering_Area_04_Perk_3", 136 },
    Lua.ReadOnly{ "biggerbooms", "Engineering_Area_05_Perk_1", 137 },
    -- Not used
    Lua.ReadOnly{ "", "Engineering_Area_05_Perk_2", 138 },
    Lua.ReadOnly{ "tesla", "Engineering_Area_06_Perk_1", 139 },
    Lua.ReadOnly{ "lightningbolt", "Engineering_Area_06_Perk_2", 140 },
    Lua.ReadOnly{ "ubercharge", "Engineering_Area_07_Perk_1", 141 },
    Lua.ReadOnly{ "insulation", "Engineering_Area_07_Perk_2", 142 },
    Lua.ReadOnly{ "gunwhisperer", "Engineering_Area_07_Perk_3", 143 },
    Lua.ReadOnly{ "fuckallwalls", "Engineering_Area_08_Perk_1", 144 },
    Lua.ReadOnly{ "playwithangles", "Engineering_Area_08_Perk_2", 145 },
    Lua.ReadOnly{ "licketysplit", "Engineering_Area_09_Perk_1", 146 },
    Lua.ReadOnly{ "jackpot", "Engineering_Area_10_Perk_1", 147 },
    Lua.ReadOnly{ "superconductor", "Engineering_Area_10_Perk_2", 148 },

    Lua.ReadOnly{ "gunslinger", "Gunslinger_Area_01_Perk_1", 149 },
    Lua.ReadOnly{ "highnoon", "Gunslinger_Area_01_Perk_2", 150 },
    Lua.ReadOnly{ "riobravo", "Gunslinger_Area_02_Perk_1", 151 },
    Lua.ReadOnly{ "desperado", "Gunslinger_Area_02_Perk_2", 152 },
    Lua.ReadOnly{ "onthefly", "Gunslinger_Area_03_Perk_1", 153 },
    Lua.ReadOnly{ "longshotdroppop", "Gunslinger_Area_03_Perk_2", 154 },
    Lua.ReadOnly{ "steadyhand", "Gunslinger_Area_04_Perk_1", 155 },
    Lua.ReadOnly{ "okcorral", "Gunslinger_Area_04_Perk_2", 156 },
    Lua.ReadOnly{ "vanishingpoint", "Gunslinger_Area_04_Perk_3", 157 },
    Lua.ReadOnly{ "afistfulofeurodollars", "Gunslinger_Area_05_Perk_1", 158 },
    Lua.ReadOnly{ "fromheadtotoe", "Gunslinger_Area_05_Perk_2", 159 },
    Lua.ReadOnly{ "grandfinale", "Gunslinger_Area_06_Perk_1", 160 },
    Lua.ReadOnly{ "acrobat", "Gunslinger_Area_06_Perk_2", 161 },
    Lua.ReadOnly{ "attritionalfire", "Gunslinger_Area_07_Perk_1", 162 },
    Lua.ReadOnly{ "wildwest", "Gunslinger_Area_07_Perk_2", 163 },
    Lua.ReadOnly{ "snowballeffect", "Gunslinger_Area_08_Perk_1", 164 },
    Lua.ReadOnly{ "westworld", "Gunslinger_Area_08_Perk_2", 165 },
    Lua.ReadOnly{ "leadsponge", "Gunslinger_Area_09_Perk_1", 166 },
    Lua.ReadOnly{ "brainpower", "Gunslinger_Area_10_Perk_1", 167 },

    Lua.ReadOnly{ "bigsleep", "Hacking_Area_01_Perk_1", 168 },
    Lua.ReadOnly{ "massvulnerability", "Hacking_Area_01_Perk_2", 169 },
    Lua.ReadOnly{ "almostin", "Hacking_Area_02_Perk_1", 170 },
    Lua.ReadOnly{ "advanceddatamine", "Hacking_Area_02_Perk_2", 171 },
    Lua.ReadOnly{ "massvulnerabilityresistance", "Hacking_Area_03_Perk_1", 172 },
    Lua.ReadOnly{ "extendednetworkinterface", "Hacking_Area_03_Perk_2", 173 },
    Lua.ReadOnly{ "turretshutdown", "Hacking_Area_04_Perk_1", 174 },
    Lua.ReadOnly{ "dataminemastermind", "Hacking_Area_04_Perk_2", 175 },
    Lua.ReadOnly{ "totalrecall", "Hacking_Area_05_Perk_1", 176 },
    Lua.ReadOnly{ "dataminevirtuoso", "Hacking_Area_06_Perk_1", 177 },
    Lua.ReadOnly{ "turrettamer", "Hacking_Area_06_Perk_2", 178 },
    Lua.ReadOnly{ "efficiency", "Hacking_Area_07_Perk_1", 179 },
    Lua.ReadOnly{ "cloudcache", "Hacking_Area_07_Perk_2", 180 },
    Lua.ReadOnly{ "massvulnerabilityquickhacks", "Hacking_Area_08_Perk_1", 181 },
    Lua.ReadOnly{ "totallerrecall", "Hacking_Area_08_Perk_2", 182 },
    Lua.ReadOnly{ "hackathon", "Hacking_Area_09_Perk_1", 183 },
    Lua.ReadOnly{ "headstart", "Hacking_Area_09_Perk_2", 184 },
    Lua.ReadOnly{ "compression", "Hacking_Area_10_Perk_1", 185 },
    Lua.ReadOnly{ "bufferoptimization", "Hacking_Area_10_Perk_2", 186 },

    Lua.ReadOnly{ "stinglikeabee", "Kenjutsu_Area_01_Perk_1", 187 },
    Lua.ReadOnly{ "roaringwaters", "Kenjutsu_Area_01_Perk_2", 188 },
    Lua.ReadOnly{ "crimsondance", "Kenjutsu_Area_02_Perk_1", 189 },
    Lua.ReadOnly{ "slowandsteady", "Kenjutsu_Area_02_Perk_2", 190 },
    Lua.ReadOnly{ "flightofthesparrow", "Kenjutsu_Area_03_Perk_1", 191 },
    Lua.ReadOnly{ "offensivedefence", "Kenjutsu_Area_03_Perk_2", 192 },
    Lua.ReadOnly{ "stuckpig", "Kenjutsu_Area_04_Perk_1", 193 },
    Lua.ReadOnly{ "shiftingsands", "Kenjutsu_Area_04_Perk_2", 194 },
    Lua.ReadOnly{ "blessedblade", "Kenjutsu_Area_05_Perk_1", 195 },
    Lua.ReadOnly{ "unbokrnespirit", "Kenjutsu_Area_05_Perk_2", 196 },
    Lua.ReadOnly{ "bloodlust", "Kenjutsu_Area_06_Perk_1", 197 },
    Lua.ReadOnly{ "floatlikeabutterfly", "Kenjutsu_Area_06_Perk_2", 198 },
    Lua.ReadOnly{ "fieryblast", "Kenjutsu_Area_07_Perk_1", 199 },
    Lua.ReadOnly{ "judgejurtyandexecutioner", "Kenjutsu_Area_07_Perk_2", 200 },
    Lua.ReadOnly{ "crimsontide", "Kenjutsu_Area_08_Perk_1", 201 },
    Lua.ReadOnly{ "deathbold", "Kenjutsu_Area_08_Perk_2", 202 },

    Lua.ReadOnly{ "silentanddeadly", "Stealth_Area_01_Perk_1", 203 },
    Lua.ReadOnly{ "crouchingtiger", "Stealth_Area_01_Perk_2", 204 },
    Lua.ReadOnly{ "hiddendragon", "Stealth_Area_02_Perk_1", 205 },
    Lua.ReadOnly{ "daggerdealer", "Stealth_Area_02_Perk_2", 206 },
    Lua.ReadOnly{ "strikefromtheshadows", "Stealth_Area_03_Perk_1", 207 },
    Lua.ReadOnly{ "assassin", "Stealth_Area_03_Perk_2", 208 },
    Lua.ReadOnly{ "legup", "Stealth_Area_03_Perk_3", 209 },
    Lua.ReadOnly{ "sniper", "Stealth_Area_04_Perk_1", 210 },
    Lua.ReadOnly{ "cutthroat", "Stealth_Area_04_Perk_2", 211 },
    Lua.ReadOnly{ "cleanwork", "Stealth_Area_05_Perk_1", 212 },
    Lua.ReadOnly{ "aggressiveantitoxins", "Stealth_Area_05_Perk_2", 213 },
    Lua.ReadOnly{ "stunningblows", "Stealth_Area_05_Perk_3", 214 },
    Lua.ReadOnly{ "ghost", "Stealth_Area_06_Perk_1", 216 },
    Lua.ReadOnly{ "fromtheshadows", "Stealth_Area_06_Perk_2", 217 },
    Lua.ReadOnly{ "commando", "Stealth_Area_07_Perk_1", 218 },
    Lua.ReadOnly{ "rattlesnake", "Stealth_Area_07_Perk_2", 219 },
    Lua.ReadOnly{ "venomousfang", "Stealth_Area_07_Perk_3", 220 },
    Lua.ReadOnly{ "restorativeshaows", "Stealth_Area_08_Perk_1", 221 },
    Lua.ReadOnly{ "hastyretreat", "Stealth_Area_08_Perk_2", 222 },
    Lua.ReadOnly{ "silentfinisher", "Stealth_Area_08_Perk_3", 223 },
    Lua.ReadOnly{ "neurotoxin", "Stealth_Area_09_Perk_1", 224 },
    Lua.ReadOnly{ "cheatdeat", "Stealth_Area_09_Perk_2", 225 },
    Lua.ReadOnly{ "hastentheinevitable", "Stealth_Area_09_Perk_3", 226 },
    Lua.ReadOnly{ "restorativeshadows", "Stealth_Area_10_Perk_1", 227 }
}

function  gamedataPerkType.Get(perkName)
    if not perkName then
        print("gamedataPerkType.Get():", "perkName is nil")
        return
    end

    perkName = perkName:lower():gsub("%W", "")
    for _, perkTable in ipairs(_gamedataPerkType) do
        if perkTable[1]:lower():gsub("%W", "") == perkName then
            return perkTable
        end
    end
end

-- Specify index as zero based.
function gamedataPerkType.GetPerkTableFromIndex(perkIndex)
    perkIndex = perkIndex + 1
    if perkIndex >= 1 and perkIndex <= #_gamedataPerkType then
        return _gamedataPerkType[perkIndex]
    end
end

function gamedataPerkType.GetAll()
    return _gamedataPerkType
end

return gamedataPerkType
