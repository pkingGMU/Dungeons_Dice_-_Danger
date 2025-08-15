-- baseState.lua
BaseState = {}
BaseState.__index = BaseState


require("states.BaseWindow")

-- Inspection --
require("helper_functions.dump")

-- Deepcopy Util --
require("helper_functions.deepcopy")

-- Camera --
local Camera = require("libraries.STALKER-X.Camera")

--Tile Handler-----------------------------------------------------------------
require("classes.Handlers.TileHandler")

--Util Point Collsion----------------------------------------------------------
local pointInObject = require("utils.PointCollision")



function BaseState.new()
    local self = setmetatable({}, BaseState)
    return self
end

function BaseState:init()
end

function BaseState:enter(persistent)
  -- init window --
  self.window = persistent.window
  
    --window sizes--
  self.window_height = self.window.window_height
  self.window_width = self.window.window_width
  self.scale_factor = self.window.scale_factor
  
  self.target_width = self.window.target_width
  self.target_height = self.window.target_height

  -- Create a render target
  self.canvas = love.graphics.newCanvas(self.window_width, self.window_height)
  
  

  -- Panning --
  self.panning = false
  local init_pan_x = 0
  local init_pan_y = 0

  -- Test Get Layer Properties --
  self.map_width = self.map.width * self.map.tilewidth
  self.map_height = (self.map.height * self.map.tilewidth)

  self.cam = Camera(self.window_width / 2, self.window_height / 2, self.window_width, self.window_height)
  -- self.cam:setFollowLerp(0.2)
  -- self.cam:setFollowLead(0)
  -- self.cam:setFollowStyle('PLATFORMER')
  self.zoom_level = 1;
  self.cam.scale = 1;

  --Create Tiles From Map------------------------------------------------------
  self.tile_handler = TileHandler()
  self.tile_handler:addMapTiles(self.map)


end


function BaseState:update(dt)

  if self.debug_key == true and self.debug_mode == false then
    print("Debug Mode On")
    self.debug_mode = true
    self.debug_key = false
  elseif self.debug_key == true and self.debug_mode == true then
    print("Debug Mode Off")
    self.debug_mode = false
    self.debug_key = false
  end

  -- Panning Update --
  if love.mouse.isDown(3) then
    if not self.panning then
        self.panning = true
        init_pan_x, init_pan_y = love.mouse.getPosition()
    else
        local current_pan_x, current_pan_y = love.mouse.getPosition()
        -- Calculate delta
        local dx = (current_pan_x - init_pan_x) / self.cam.scale
        local dy = (current_pan_y - init_pan_y) / self.cam.scale

        -- Update camera (subtract because moving mouse right moves world left)
        self.cam.x = clamp(self.cam.x - dx, (self.window_width / self.cam.scale) / 2, self.map_width - (self.window_width / self.cam.scale) / 2)
        self.cam.y = clamp(self.cam.y - dy, (self.window_height / self.cam.scale) / 2, self.map_height - (self.window_height / self.cam.scale) / 2)

        -- Reset init_pan for next frame
        init_pan_x, init_pan_y = current_pan_x, current_pan_y
    end
elseif self.panning then
    self.panning = false
end

  --Update Map-----------------------------------------------------------------
  self.map:update(dt)

  --Get Mouse Coords (account for scale)-----------------------------------------------------------
  local mx, my = love.mouse.getPosition()
  mx = mx / self.scale_factor
  my = my / self.scale_factor
  mx, my = self.cam:toWorldCoords(mx, my)

    -- print("MouseX World: " .. mx .. "MouseY World: " .. my)
    -- print("CamX: " .. self.cam.x - self.window_width / 2)
  --Update Tile Handler--------------------------------------------------------
  self.tile_handler:update(dt, mx, my)
end

function BaseState:draw()

  love.graphics.setCanvas(self.canvas)
  love.graphics.clear(0, 0, 0, 0)
  -- Camera --
  self.cam:attach()
  love.graphics.setColor(1, 1, 1, 1)

  self.map:drawLayer(self.map.layers["Background"])
  self.map:drawLayer(self.map.layers["PlayTiles"])

  -- This will be different for every State --
  self:render()
  
  self.cam:detach()
  love.graphics.setCanvas()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setBlendMode("alpha", "premultiplied")
  
  love.graphics.draw(self.canvas, 0, 0, 0, self.scale_factor, self.scale_factor)
  love.graphics.setBlendMode("alpha")
end

function BaseState:SoftReset()

end

function BaseState:HardReset()

end

function BaseState:mousepressed(x, y, button)

  if button == 3 then
    print("Middle Mouse Button Pressed")
  end
end


function BaseState:mousereleased(x, y, button)
  if button == 3 then
    self.panning = false
    print("Middle Mouse Button Released")
  end
  
end

function BaseState:wheelmoved(x, y)
  if (y > 0) and (self.cam.scale < 2) then
    self.zoom_level = self.cam.scale +.05
    self.cam.scale = self.zoom_level
    print(self.cam.scale)
  elseif y < 0 and (self.cam.scale > 0.75)then
    self.zoom_level = self.cam.scale - .05
    self.cam.scale = self.zoom_level
    print(self.cam.scale)
  end
  
  
end

function BaseState:keypressed(key)

    if key == 'b' then
        self.b_down = false
    end

    if key == 'a' then
        self.a_down = false
    end

    if key == 's' then
        self.s_down = false
    end

    if key == 'd' then
        self.d_down = false
    end

    if key == 'w' then
        self.w_down = false
    end

    if key == "space" then
      self.space = false
    end

    if key == 'c' then
        self.c_down = false
    end
    
end

function BaseState:keyreleased(key)

  
    if key == 'b' then
        self.b_down = true
    end

    if key == 't' then
        self.t_down = true
    end

    if key == 'c' then
      self.my_player.dash = true
    end


    if key == 'a' then
        self.a_down = true
    end

    if key == 's' then
        self.s_down = true
    end

    if key == 'd' then
      self.d_down = true
      self.debug_key = true

    end

    if key == 'w' then
        self.w_down = true
    end    
    if key == 'c' then
        self.c_down = true
    end


    
end

function clamp(val, min, max)
  return math.max(min, math.min(max, val))
end
