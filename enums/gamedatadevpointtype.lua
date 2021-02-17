-- luacheck: ignore Lua
local gamedataDevelopmentPointType = {}

local _gamedataDevPointType = Lua.ReadOnly{
    Lua.ReadOnly{ "Attribute", 0 },
    Lua.ReadOnly{ "Primary", 1 },
    Lua.ReadOnly{ "Secondary", 2 }
}

function gamedataDevelopmentPointType.Get(devPointName)
    if not devPointName then
        print("gamedataDevelopmentPointType.Get():", "devPointName is nil")
        return
    end

    devPointName = devPointName:lower():gsub("%W", "")
    for _, devPointTable in ipairs(_gamedataDevPointType) do
        if devPointTable[1]:lower():gsub("%W", "") == devPointName then
            return devPointTable
        end
    end
end

function gamedataDevelopmentPointType.GetDevPointTableFromIndex(devPointIndex)
    devPointIndex = devPointIndex + 1
    if devPointIndex >= 1 and devPointIndex <= #_gamedataDevPointType then
        return _gamedataDevPointType[devPointIndex]
    end
end

function gamedataDevelopmentPointType.GetAll()
    return _gamedataDevPointType
end

gamedataDevelopmentPointType.Attribute  = _gamedataDevPointType[1][2]
gamedataDevelopmentPointType.Primary    = _gamedataDevPointType[2][2]
gamedataDevelopmentPointType.Secondary  = _gamedataDevPointType[2][2]

return Lua.ReadOnly(gamedataDevelopmentPointType)
