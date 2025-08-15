local Class = require("libraries.hump-master.class")


-- Local Imports --

-- Parent class NONE RN --
Tile = Class{}

function Tile:init(params)
    self.x = params.x or 0
    self.y = params.y or 0
    self.w = params.width or 0
    self.h = params.height or 0

    self.id = params.id or 0
    self.rotation = params.rotations or 0
    self.visible = params.visible or true
    self.properties = params.properties or {}
    self.name = params.name or ""

    self.persistent = true
    self.type = params.type or 'bruh'
end

function Tile:update(dt, state)
end

function Tile:interact()
    print("INTERACTED WITH: " .. self.id)
end
-- function Tile:addToTileHandler(tile, tileHandler)

--     tileHandler.tile_idx = tileHandler.tile_idx + 1
--     local string_key = 'tile'.. tostring(tileHandler.tile_idx)
--     table.insert(tileHandler.tile_table, tile)

-- end
