local Class = require("libraries.hump-master.class")

--Local Imports----------------------------------------------------------------
local pointInObject = require("utils.PointCollision")

RollerHandler = Class()

local possible_values
local die_1_value
local die_2_value
local die_3_value

function RollerHandler:init()

end

function RollerHandler:checkCollision(mx, my, button)

  if pointInObject(mx, my, button) then
    print("Colliding with button")
    return true
  end

  return false

end
