-- luacheck: ignore json
local Config = {}


local entry         = "ScriptPsycho"
local configFile    = "scriptpsychoconfig.json"

-- { { statStr, statValue }, { statStr, statValue } }
local DEFAULT_AUTO_STATS                = {}
local DEFAULT_AMMO_TO_REFILL            = {
    "Ammo.HandgunAmmo",
    "Ammo.RifleAmmo",
    "Ammo.ShotgunAmmo",
    "Ammo.SniperRifleAmmo",
    "Ammo.Special"
}

local DEFAULT_AMMO_THRESHOLD_AND_MAX    = {
    [DEFAULT_AMMO_TO_REFILL[1]] = { 40, 600 },
    [DEFAULT_AMMO_TO_REFILL[2]] = { 40, 600 },
    [DEFAULT_AMMO_TO_REFILL[3]] = { 40, 600 },
    [DEFAULT_AMMO_TO_REFILL[4]] = { 40, 600 },
    [DEFAULT_AMMO_TO_REFILL[5]] = { 40, 600 }
}

local DEFAULTS  = {
    modEnabled              = true,
    autoCmdsEnabled         = true,
    autoReduceFallDmg       = true,
    autoWalk                = true,
    walkSpeed               = 9,
    runSpeed                = 40,
    autoSetCarryCapacity    = true,
    carryCapacity           = 1000,
    autoWalkInCombat        = true,
    autoRunAfterOutCombat   = true,
    autoStatsEnabled        = false,
    autoStats               = DEFAULT_AUTO_STATS,
    autoRefillLowAmmo       = true,
    ammoToRefill            = DEFAULT_AMMO_TO_REFILL,
    ammoThresholdAndMax     = DEFAULT_AMMO_THRESHOLD_AND_MAX
}

local DEFAULT_CONFIG = { [entry] =  DEFAULTS }

function Config.CreateDflt()
    Config.Write(configFile, DEFAULT_CONFIG)
end

-- Gets and returns value of key; if value of key is nil, add key with value
-- default and return newwly set value
function Config.GetSet(key, default, fileName)
    default = default or DEFAULTS[key]
    -- Not using 'not default' as default could be false
    if default == nil then  print("Config.GetSet(): No default for", key) end
    local value = Config.Get(key)
    if value == nil then
        print("Config.GetSet(): value is nil")
        return Config.Set(key, default, fileName or configFile)
    end

    return value
end

function Config.Get(key, fileName)
    fileName    = fileName or configFile
    local table = Config.Read(fileName)
    local value = table[entry][key]
    if value == nil then print("Config.Get():", key, "not found.") return end
    return value
end

-- If key isn't in table, key will be created.
function Config.Set(key, value, fileName)
    if value == nil then
        print("Config.Set(): Second argument 'value' must be provided")
        return
    end

    fileName = fileName or configFile
    local table = Config.Read(fileName)
    -- Not using 'table == nil' as what is returned from Config.Read() is never
    -- false.
    if not table then print("Config.Set(): Table is nil") return end
    table[entry][key] = value
    Config.Write(fileName, table)
    return value
end

function Config.Read(fileName)
    fileName    = fileName or configFile
    local file  = io.open(fileName, "r")
    if not file and fileName == configFile then
        -- We don't need to close file
        print("Config.Read(): Creating Default Config")
        Config.CreateDflt()
        file = io.open(fileName, "r")
        if not file then
            error("Config:read():", "Something fucked up...")
        end
    end

    -- Storing in variable so we can close the stream.
    -- Do we need to close the stream?  Or will it be closed automatically?
    local contents = file:read("a")
    -- Should we close here as we aren't going to do anymore reading?
    file:close()
    -- contents should not be nil as we checked in previous condtion branch
    if contents == "" then
        print("Config.Read():", "Config file was empty..")
        print("Config.Read():", "Create Default One")
        -- Do we need to close the file here because we have read it?
        --file:close()
        Config.CreateDflt()
        -- Going to attempt to open the newly created config file and return the
        -- table
        return Config.Read()
    end

    local table = json.decode(contents)
    --file:close()

    return table
end

function Config.Write(fileName, table)
    if not table then print("Config.Write(): No table given.") return end
    fileName    = fileName or configFile
    local file  = io.open(fileName, "w")
    file:write(json.encode(table))
    file:close()
end

return Config
