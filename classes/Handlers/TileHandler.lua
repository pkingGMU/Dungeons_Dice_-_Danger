
local Class = require("libraries.hump-master.class")

-- Local Imports --
require("classes.Objects.Tile")
--Util Point Collsion----------------------------------------------------------
local pointInObject = require("utils.PointCollision")


TileHandler = Class()

local num_tiles_width
local num_tiles_height

function TileHandler:init()
    self.tile_map = {}
    self.tile_table = {}
    self.tile_idx = 0

end


function TileHandler:addMapTiles(game_map)

  for tile_idx, tile in pairs(game_map.objects) do
    if tile == nil then
      goto continue
    end
    if tile.type == "num_1" then
    elseif tile.type == "num_2" then
    end
    --Create Tiles-------------------------------------------------------------
    local instance = Tile({x = tile.x, y = tile.y - 32, width = tile.width, height = tile.height, id = tile.id, type = tile.type})
    -- print(instance.x .. instance.y .. instance.w .. instance.h)
    table.insert(self.tile_table, instance)
    ::continue::
  end

    ::continue::
    -- print(#self.tile_table)

end

function TileHandler:checkCollision(mouse_x, mouse_y)
  for i, tile in ipairs(self.tile_table) do
    -- print("MouseX: " .. mouse_x .. "TileX: " .. tile.x)
    -- print("MouseY: " .. mouse_y .. "TileY: " .. tile.y)
    -- print(tile.w .. "Height" .. tile.h)
    -- print(".........................")
    if pointInObject(mouse_x, mouse_y, tile) then
      print("Colliding with" .. tile.type)
      tile:interact()
      return true
    else
    end
  end


      return false
end

-- function TileHandler:addBorderTiles(screen_height, screen_width)

--   num_tiles_height = math.floor(screen_height / 32) + 1
--   num_tiles_width = math.floor(screen_width / 32)



--   for y_tile=1, num_tiles_height do

--     local temp_table = {}

--     for x_tile=1, num_tiles_width do

--       if y_tile == 1 or y_tile == num_tiles_height then
--           table.insert(temp_table, 1)

--       elseif x_tile == 1 or x_tile == num_tiles_width then
--           table.insert(temp_table, 1)
--       else
--           table.insert(temp_table, 0)
--       end




--     end

--     table.insert(self.tile_map, temp_table)

--   end

-- end
