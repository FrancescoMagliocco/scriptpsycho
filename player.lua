-- luacheck: ignore Player Config Game
local Player = {}

Player.Perks        = require("player/playerperks")
Player.Skills       = require("player/playerskills")
Player.Inventory    = require("player/playerinventory")
Player.Stats        = require("player/playerstats")

function Player.GetPlayerDevSys()
    return Game.GetScriptableSystemsContainer():Get("PlayerDevelopmentSystem")
end

function Player.GetDevData()
    return Player.GetPlayerDevSys():GetDevelopmentData(Player.GetPlayer())
end

local walkSpeed     = nil
function Player.GetWalkSpeed()
    return walkSpeed
end

function Player.UpdateWalkSpeed(speed)
    walkSpeed = Config.Set("walkSpeed", speed)
end

local runSpeed      = nil
function Player.GetRunSpeed()
    return runSpeed
end

function Player.UpdateRunSpeed(speed)
    runSpeed = Config.Set("runSpeed", speed)
end

local carryCapacity = nil
function Player.GetCarryCapacity()
    return carryCapacity
end

function Player.UpdateCarryCapacity(capacity)
    carryCapacity = Config.Set("carryCapacity", capacity)
end

function Player.GetPlayer()
    return Game.GetPlayer()
end

function Player.GetPlayerID()
    return Player.GetPlayer():GetEntityID()
end

function Player.IsRunning()
    return Player.Stats.GetStat("MaxSpeed") > Player.GetRunSpeed()
end

function Player.SetCarryCapacity(capacity)
    Player.Stats.ModStat("CarryCapacity", capacity)
end

function Player.ReduceFallDmg()
    Player.Stats.ModStat("FallDamageReduction", 1)
end

function Player.Walk()
    Player.Stats.ModStat("MaxSpeed", walkSpeed)
end

function Player.Run()
    Player.Stats.ModStat("MaxSpeed", runSpeed)
end

function Player.init()
    walkSpeed       = Config.GetSet("walkSpeed")
    runSpeed        = Config.GetSet("runSpeed")
    carryCapacity   = Config.GetSet("carryCapacity")
    Player.Perks.init()
    Player.Skills.init()
end

return Player
