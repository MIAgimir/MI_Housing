-- importing core ox functions --
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- local variabls --

-- housing context menu via ox_lib --
lib.registerContext({
  id = 'user_housingmenu',
  title = 'Housing menu',
  options = {
    {
        title = 'Spawn Housing',
        description = 'spawn test housing',
        icon = 'house',
        onSelect = function()
            print("house spawned")
            TriggerEvent('create_aptstart_inscript', function(spawn)
            end)
        end
    },
    {
        title = 'Despawn Housing',
        description = 'despawn test housing',
        icon = 'door-open',
        onSelect = function()
            print("house despawned")
            TriggerEvent('despawnInt', function(objects, cb)
            end)
        end
    }
  }
})

-- net event to open housing menu --
exports('open_userhousingmenu', function()
    lib.showContext('user_housingmenu')
end)