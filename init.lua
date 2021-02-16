-- luacheck: ignore ScriptPsycho Config Player
local ScriptPsycho = {
    description = "",
    rootPath    = ""
}

-- luacheck: ignore SP
SP = require("scriptpsycho")


-- luacheck: ignore registerForEvent
registerForEvent("onInit", function()
    -- luacheck: ignore Attribs
    SP.init()
    if SP.Verbose then print("SP.init() competed!") end
    --Attribs.init()
    if SP.Verbose then print("Attribs.init()  competed!") end
    Player.init()
    if SP.Verbose then print("Player.init() completede") end
end)

local playerWasInCombat = false

-- luacheck: ignore delta
registerForEvent("onUpdate", function(delta)
    if SP.Get("modEnabled") then
        --[[
        --  May be able to use "MaxSpeed" to determine if player is alive or dead.
        --  When executing Player:OnDied(),  MaxSpeed is 0; we need to check in menu
        --  what the speed is as well
        --  MaxSpeed in menu for me was: 3.722222328186
        --]]
        if SP.Get("autoCmdsEnabled") then
            SP.UpdateAutoCmds(SP.DoAutoCmds()
                or Player.GetPlayer().incapacitated)
            --[[
            --  Wont run upon entering game as when in the starting screen, somehow
            --  Player.GetPlayer():IsMoving() is true at least once.
            --]]
            if SP.DoAutoCmds() and Player.GetPlayer():IsMoving() then
                SP.UpdateAutoCmds(false)
                SP.Do("autoReduceFallDmg", Player.ReduceFallDmg)
                SP.Do("autoSetCarryCapacity",
                    Player.SetCarryCapacity,
                    Player.GetCarryCapacity())

                SP.Do("autoWalk", Player.Walk)
                SP.Do("autoStatsEnabled", SP.DoSetStats)
            end
        end

        if SP.Get("autoWalkInCombat")
                and Player.GetPlayer():IsInCombat()
                and Player.IsRunning() then
            -- So we can set player back to running
            playerWasInCombat = true
            Player.Walk()
        end

        if SP.Get("autoRunAfterOutCombat")
                and not Player.GetPlayer():IsInCombat() then
            playerWasInCombat = false
            Player.Run()
        end

        SP.Do("autoRefillLowAmmo", SP.CheckAmmo)

    end
end)

registerForEvent("onShutdown", function()
end)

print("Loaded ScriptPsycho!")
return SP
