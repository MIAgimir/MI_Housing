local isNew = false

RegisterNetEvent('mi-housing:client:setnewstate', function(bool)
    isNew = bool
end)

-- Teleport to interior
function TeleportIntoInterior(x, y, z, h)
    CreateThread(function()
    SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
    SetEntityHeading(PlayerPedId(), h)
    Wait(100)
    DoScreenFadeIn(1000)
    end)
end

-- Despawn interior
exports('DespawnInterior', function(objects, cb)
    CreateThread(function()
        for _, m in pairs(objects) do
            if DoesEntityExist(m) then
                DeleteEntity(m)
            end
        end
    end)
end)

-- Shell Creation
local function SpawnShell(spawn, exit_v4, model)
    local objects = {}
    local offsets = {}
    offsets.exit = exit_v4
    while not IsScreenFadedOut() do
        Wait(10)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1000)
    end
    local spawned_interior = CreateObject(model, spawn.x, spawn.y, spawn.z, false, false, false)

    FreezeEntityPosition(spawned_interior, true)
    objects[#objects+1] = spawned_interior
    TeleportIntoInterior(spawn.x + offsets.exit.x, 
        spawn.y + offsets.exit.y, 
        spawn.z + offsets.exit.z, 
        spawn.h + offsets.exit.h)
    return { objects, offsets }
end

exports('SpawnShell', function(spawn, exit_v4, model)
    return SpawnShell(spawn, exit_v4, model)
end)

exports('create_apt_start', function(spawn)
    local exit = json.decode('{"x": 1.561, "y": -14.305, "z": 1.147, "h":2.263}')
    local model = 'lev_apart'
    SpawnShell(spawn, exit_v4, model)
end)