local Class = require("libraries.hump-master.class")


-- Local Imports --

-- Parent class NONE RN --
Tile = Class{}

function Tile:init(params)
    self.x = 0 or params.x
    self.y = 0 or params.y
    self.w = 0 or params.width
    self.h = 0 or params.height

    self.id = -1 or params.id
    self.rotation = 0 or params.rotations
    self.visible = true or params.visible
    self.properties = {} or params.properties
    self.name = "" or params.name

    self.persistent = true
    self.type = 'Tile'
end

function Tile:update(dt, state)
end

-- function Tile:addToTileHandler(tile, tileHandler)

--     tileHandler.tile_idx = tileHandler.tile_idx + 1
--     local string_key = 'tile'.. tostring(tileHandler.tile_idx)
--     table.insert(tileHandler.tile_table, tile)

-- end
