local function pointInObject(x, y, tile)

    return x >= tile.x
       and x <= tile.x + tile.w
       and y >= tile.y
       and y <= tile.y + tile.h
end

return pointInObject
