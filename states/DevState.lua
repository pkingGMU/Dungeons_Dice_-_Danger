-- devRoomState.lua

require("states.BaseState")

-- Local imports --
local sti = require('libraries.Simple-Tiled-Implementation.sti')

-- Camera --
local Camera = require("libraries.STALKER-X.Camera")

DevState = BaseState.new()

function DevState:init()
  print("DevState init")
  local self = BaseState.new()                   -- Call the BaseState constructor
  setmetatable(self, { __index = DevState }) -- Set metatable to DevState
  return self
end

function DevState:enter(prev, persistent)
  self.map = sti("assets/maps/map1.lua")
  BaseState.enter(self, persistent)


end

function DevState:update(dt)
  BaseState.update(self, dt)
end


function DevState:render()
  
end

function DevState:keypressed(key)
  BaseState.keypressed(self, key)
end

function DevState:keyreleased(key)
  BaseState.keyreleased(self, key)

end

return DevState
