local LuaHelper = {}

--[[
--  As seen in Programming in Lua 4th edition: Read-only tables
--]]
function LuaHelper.ReadOnly(t)
    local proxy = {}
    local mt    = {
        __index = t,
        --[[
        --  Are parameters t, k and v passed from __newindex?
        --]]
        -- luacheck: ignore t k v
        __newindex  = function(t, k, v)
            --[[
            --  From an example online, the 2 apparently is the index of which
            --  was attempted to be updated?  If so, this wont be valid for
            --  every index.  I didn't read much at all on it.
            --]]
            error("attempt to update read-only table", 2)
        end
    }

    setmetatable(proxy, mt)
    return proxy
end

return LuaHelper
