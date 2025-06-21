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
  BaseState.enter(self, persistent)
  

end

function DevState:update(dt)

end


function DevState:draw()
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(0, 0, 0, 0)
  -- Camera --
  self.cam:attach()
  love.graphics.setColor(1, 1, 1, 1)
  self.cam:detach()
  love.graphics.setCanvas()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setBlendMode("alpha", "premultiplied")
  
  love.graphics.draw(self.canvas, 0, 0, 0, self.scale_factor, self.scale_factor)
  love.graphics.setBlendMode("alpha")

end

function DevState:keypressed(key)
  BaseState.keypressed(self, key)
end

function DevState:keyreleased(key)
  BaseState.keyreleased(self, key)

end

return DevState
