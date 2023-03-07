-- ox_core get core
local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

-- local variables for apartments
local house_ispresent = false
local house_closest = nil
local house_current = nil
local house_owned = false
local house_doorbell = 0
local offset_current = 0
local house_obj = {}
local offsets = nil
local house_doorbell_rang = nil

-- targets
local house_targets = {}

-- ox_target zone variables
local zone_stash_ispresent = false
local zone_outfit_ispresent = false
local zone_logout_ispresent = false

-- ox_lib menus
local function entrancemenu_show()
end

local function entrancemenu_hide()
end