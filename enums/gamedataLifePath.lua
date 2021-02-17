-- luacheck: ignore Lua
local gamedataLifePath = {}

local _gamedataLifePath = Lua.ReadOnly{
    Lua.ReadOnly{ "Corporate", 0 },
    Lua.ReadOnly{ "Nomad", 1 },
    Lua.ReadOnly{ "StreetKid", 2 }
}

function gamedataLifePath.Get(lifePathName)
    lifePathName = lifePathName:lower():gsub("%W", "")
    for _, lifePathTable in ipairs(_gamedataLifePath) do
        if  lifePathTable[1]:lower():gsub("%W", "") == lifePathName then
            return lifePathTable
        end
    end
end

-- Specify index as zero based.
function gamedataLifePath.GetLifePathTableFromIndex(lifePathIndex)
    lifePathIndex = lifePathIndex + 1
    if lifePathIndex >= 1 and lifePathIndex <= #_gamedataLifePath then
        return _gamedataLifePath[lifePathIndex]
    end
end

function gamedataLifePath.GetAll()
    return _gamedataLifePath
end

return gamedataLifePath
