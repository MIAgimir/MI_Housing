-- importing core ox functions --
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- local variabls --
local  newState = false

RegisterNetEvent('mihousing:client:seState', function(bool)
    newState = bool
end)

function intTeleport(x, y, z, h)
    CreateThread(function()
        SetEntityCoords(PlayerPedId(), 
        x, y, z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), h)
        Wait(100)
        DoScreenFadeIn(1000)
    end)
end

exports('despawnInt', function(objects, cb)
    CreateThread(function()
        for __, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end
    end)
end)

AddEventHandler('despawnInt', function(objects, cb)
    CreateThread(function()
        for __, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end
        cb()
    end)
end)

local function createInt(spawn, exit, model)
    local objs = {}
    local offsets = {}
    offsets.exit = exit
    DoScreenFadeOut(500)
    while not DoScreenFadeOut() do
        Wait(10)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1000)
    end
    local apmt = CreateObject(
        model, spawn.x, spawn.y, spawn.z, false, false, false)

    FreezeEntityPosition(apmt, true)
    objs[#objs+1] = apmt
    intTeleport(
        spawn.x + offets.exit.x, 
        spawn.y + offets.exit.y, 
        spawn.z + offets.exit.z, 
        offsets.exit.h)
end

AddEventHandler('create_aptstart_inscript', function(spawn)
    local exit = json.decode('{"x": 0.80353, "y": 1.94699, "z": 0.960894, "h": 270.76}')
    local model = 'lev_apartment_shell'
    local obj = createInt(spawn, exit, model)

    if obj and obj[2] then
        obj[2].clothes = json.decode('{"x": -7.04442, "y": -2.97699, "z": 0.960894, "h": 181.75}')
		obj[2].stash = json.decode('{"x": -3.04442, "y": 2.17699, "z": 0.960894, "h": 181.75}')
		obj[2].logout = json.decode('{"x": 1.010176, "y": 2.29546, "z": 0.960894, "h": 91.18}')
    end
    
    return { obj[1], obj[2] }
end)

exports('createapt_starter', function(spawn)
    local exit = json.decode('{"x": 0.80353, "y": 1.94699, "z": 0.960894, "h": 270.76}')
    local model = 'lev_apartment_shell'
    local obj = createInt(spawn, exit, model)

    if obj and obj[2] then
        obj[2].clothes = json.decode('{"x": -7.04442, "y": -2.97699, "z": 0.960894, "h": 181.75}')
		obj[2].stash = json.decode('{"x": -3.04442, "y": 2.17699, "z": 0.960894, "h": 181.75}')
		obj[2].logout = json.decode('{"x": 1.010176, "y": 2.29546, "z": 0.960894, "h": 91.18}')
    end
    if newState then
        SetTimeout(750, function()
            newState = false
        end)
    end
    return { obj[1], obj[2] }
end)