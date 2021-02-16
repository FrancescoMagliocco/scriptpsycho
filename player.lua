--Player = { description = "", rootPath = ScriptPsycho.rootPath }
-- luacheck: ignore Player Config Game SSC
Player = {}

--[[
--  We aren't using local because we need to access these from other classes
--]]
-- luacheck: ignore Attribs Skills Perks
--Attribs = require("attributes")
--Skills  = require("skills")
--Perks   = require("perks")

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

--[[
--  This function is unaware if statName is actually recogniszed internally or
--  not.
--
--  On some occasions, when I have mistyped a stat name in the conosle, the
--  returned value was 24.  Depending on what you're trying to retrieve, you can
--  use this value to determine a successfuly retrieval or not if you wish.  If
--  you're trying to retrieve the level of an attribute or skill, you will be
--  fine as the max level that can be returned is 20.
--]]

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

--[=[
function Player.SetAttLevel(attribName, level)
    local attrib = Attribs.GetAtt(attribName)
    if not attrib
        --[[
        --  If we set an attribute to level 0 followed by setting the level of
        --  that same attribute to -5; the level of that attribute in game will
        --  still be shown as 0.  However, if we try to set that attribute to
        --  level 10; instead of that attribute showing level 10 in game, the
        --  level will actually be 5.
        --]]
        or level < 0 then
        print("Player.SetAttLevel(): You must specify a level greater than or equal to 0")
        return
    end

    --[[
    --  If we set an attribute to say level 30, in game, that attribute will
    --  display as level 20; however, if we try to set that attribute to level
    --  10, the level of that attribute will still be displayed as 20.  If we
    --  were to try again and set that attribute to level 10 a second time, the
    --  level for that attribute in game will actually be shown as level 10.
    --
    --  I am not sure if this carrys over if game is restarted or if that affect
    --  is only present during the current running instance.
    --]]
    level = level > 20 and 20 or level
    Game.SetAtt(attrib.name, level)
end
--]=]

function Player.init()
    walkSpeed       = Config.GetSet("walkSpeed")
    runSpeed        = Config.GetSet("runSpeed")
    carryCapacity   = Config.GetSet("carryCapacity")
    Player.Perks.init()
    Player.Skills.init()
end

return Player
