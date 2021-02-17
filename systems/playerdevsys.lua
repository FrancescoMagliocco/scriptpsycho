-- luacheck: ignore Lua Player gamedataLifePath
local PlayerDevelopmentSystem = {}

PlayerDevelopmentSystem.PlayerDevelopmentData = Lua.ReadOnly{
    GetLifePath = function()
        -- Might be userdata, so we need to convert to string
        local lifePath  = tostring(Player.GetDevData():GetLifePath())
        -- Just incase there is an issue simular to StatsSys.GetStatLimitMin(),
        -- we are explicitly converting the result of string functions to number
        return gamedataLifePath.GetLifePathTableFromIndex(
            tonumber(lifePath:sub(lifePath:find("#(") + 1, -2)))[1]
    end,
    -- Returns GameObject
    GetOwner    = function()
        return Player.GetDevData():GetOwner()
    end,
    -- Returns EntityID
    GetOwnerID  = function()
        return Player.GetDevData():GetOwnerID()
    end
}


return PlayerDevelopmentSystem
