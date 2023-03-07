exports('spawn_apt_start', function(spawn)
    local objects = {}
    local offsets = {}
	offsets.exit = json.decode('{"x": 6.04, "y": 0.34, "z": 1.03, "h": 357.99}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel('create_apt_start')
	while not HasModelLoaded('create_apt_start') do
	    Wait(1000)
	end
	local house = CreateObject('create_apt_start', spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(
        spawn.x + offsets.exit.x, 
        spawn.y + offsets.exit.y, 
        spawn.z + offsets.exit.z, 
        offsets.exit.h)
    return { objects, offsets }
end)