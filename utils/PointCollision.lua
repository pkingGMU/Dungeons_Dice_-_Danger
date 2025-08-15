local function pointInObject(x, y, obj)
    return x >= obj.x
       and x <= obj.x + obj.width
       and y >= obj.y
       and y <= obj.y + obj.height
end

return pointInObject
