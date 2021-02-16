-- luacheck: ignore SP Lua Config Attribs Skill Perk Player TS SSC Game
-- luacheck: ignore gamedataStatType gamedataProficiencyType gamedataPerkType
-- luacheck: ignore Stats
local SP = {}


Lua     = require("utils/luahelper")
SP.Lua = Lua


gamedataStatType        = require("enums/gamedataStatType")
Config  = require("utils/config")
SP.Config = Config
Skill   = require("classes/skill")

Perk    = require("classes/perk")
Stats   = require("systems/statssystem")
Player  = require("player")
SP.Player = Player

--TS  = Game.GetTransactionSystem()
--SSC = Game.GetScriptableSystemsContainer()

gamedataProficiencyType = require("enums/gamedataProficiencyType")
gamedataPerkType        = require("enums/gamedataPerkType")

local opts  = {
    modEnabled              = nil,
    autoCmdsEnabled         = nil,
    autoReduceFallDmg       = nil,
    autoSetCarryCapacity    = nil,
    autoWalk                = nil,
    autoWalkInCombat        = nil,
    autoRunAfterOutCombat   = nil,
    autoStatsEnabled        = nil,
    autoStats               = nil,
    autoRefillLowAmmo       = nil,
    amooToRefill            = nil,
    amooThresholdAndMax     = nil
}

-- Stupid variable name
local got = {}

SP.Verbose = true

function SP.Get(key)
    local value = opts[key]
    if value == nil and got[key] == nil then
        print("SP.Get():", key, "is not in table")
        got[key] = false
        return
    end

    -- Wasted memory once not needed anymore
    local _got = got[key]

    if  _got == nil or (not _got and value) then
        print(key, not value and "not enabled" or "enabled")
        got[key] = value
    end

    return value
end

local autoCmds = true
function SP.DoAutoCmds()
    return autoCmds
end

function SP.UpdateAutoCmds(value)
    autoCmds = value
end

function SP.DoSetStats()
    --[[
    --  Not going to check if table is empty as the user may not want any stats
    --  to be modified, and may have not been aware the option
    --  'autoStatsEnabled' exists.
    --]]
    for _, value in pairs(SP.Get("autoStats")) do
        if #value < 2 then
            print("SP.DoSetStats():", "Format for 'autoStats' is:")
            print("{statStr, value}")
        else Player.Stats.ModStat(value[1], value[2]) end
    end
end

function SP.Do(key, callback, arg)
    if SP.Get(key) then callback(arg) end
end

function SP.CheckAmmo()
    local ammoThresholdAndMax = SP.Get("ammoThresholdAndMax")
    -- So we don't redefine the variable each iteration of the for loop
    -- luacheck: ignore ammoTable
    local ammoTable = nil
    for _, ammoStr in ipairs(SP.Get("ammoToRefill")) do
        ammoTable = ammoThresholdAndMax[ammoStr]
        -- We need length to be atleast 2; if longer, just ignore the rest
        if #ammoTable[ammoStr] < 2 then
            print("SP.CheckAmmo()", "ammoThresholdAndMax")
            -- Not going to return as there may other entires that are valid
        elseif Player.Inv.GetCount(ammoStr) <= ammoTable[1] then
            Player.Inv.AddToInv(ammoStr, ammoTable[2])
        end
    end
end

local _opts = {
    "modEnabled",
    "autoCmdsEnabled",
    "autoReduceFallDmg",
    "autoSetCarryCapacity",
    "autoWalk",
    "autoWalkInCombat",
    "autoRunAfterOutCombat",
    "autoStatsEnabled",
    "autoStats",
    "autoRefillLowAmmo",
    "ammoToRefill",
    "ammoThresholdAndMax"
}

function SP.ReloadConfig()
    for _, key in pairs(_opts) do
        opts[key]   = Config.GetSet(key)
    end
end

function SP.init()
    SP.ReloadConfig()
end

return SP
