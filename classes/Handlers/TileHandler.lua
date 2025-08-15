
local Class = require("libraries.hump-master.class")

-- Local Imports --
require("classes.Objects.Tile")

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
    local instance = Tile({x = tile.x, y = tile.y, w = tile.width, h= tile.height})
    table.insert(self.tile_table, instance)
    ::continue::
  end

    ::continue::


  -- for type_idx, tile_type in pairs(game_map.tileInstances) do
  --   if game_map.tileInstances[type_idx] == nil then
  --     goto continue
  --   end
  --   for tile_idx, tile in pairs(game_map.tileInstances[type_idx]) do
  --     local env_tile = game_map.tileInstances[type_idx][tile_idx]

  --     if env_tile.layer.name == 'Object' or env_tile.layer.name == 'Item' then

  --     elseif env_tile.layer.name == 'Spawn' then
  --       --Tile({x = env_tile.x, y = env_tile.y, w = 32, h = 32, can_collide = false, tag = 'player_spawn'}, objectHandler, self)
  --       local obj_params = {class = "Tile", type = "Tile", level = level, x = env_tile.x, y = env_tile.y, w = 32, h = 32, can_collide = false, tag = 'player_spawn', soft_reset = true}
  --       local instance = ObjectFactory.create(obj_params, objectHandler)
  --       table.insert(WorldState[level].default.objects, instance)

  --     else
  --       --Tile({x = env_tile.x, y = env_tile.y, w = 32, h = 32, can_collide = true}, objectHandler, self)
  --       local obj_params = {class = "Tile", type = "Tile", level = level, x = env_tile.x, y = env_tile.y, w = 32, h = 32, can_collide = true, soft_reset = true}
  --       local instance = ObjectFactory.create(obj_params, objectHandler)
  --       table.insert(WorldState[level].default.objects, instance)

  --     end
  --   end
  --     ::continue::
  -- end



end

function TileHandler:update(dt)

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
