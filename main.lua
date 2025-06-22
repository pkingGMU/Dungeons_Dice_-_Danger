---@diagnostic disable: need-check-nil

-- Debug --
--if arg[2] == "debug" then
--    require("lldebugger").start()
--end

-- LUME Debug tables --
--local lume = require "lume/lume.lua"


-- Global Imports --
package.path = package.path .. ";/usr/share/lua/5.4/?.lua"
local Class = require("libraries.hump-master.class")
-- main.lua
local Gamestate = require "libraries.hump-master.gamestate"
-- Load the necessary state files
require("states.BaseState")                 -- Base state with common methods
local DevState = require("states.DevState")  -- DevState (state for development/debug mode)


require("states.BaseWindow") -- Base Window
local csv = require("libraries.lua-csv-master.lua.csv")


-- Local imports --
-- STI --
local sti = require('libraries.Simple-Tiled-Implementation.sti')

-- Main Objects --
local state

function love.load()

  -- Hump gamestate init --
  Gamestate.registerEvents()

  -- Load Window --
  local window = BaseWindow()
 -- Persistent variables --
  local persistent = {
    window = window,
  }
    
  --Gamestate.push(DevRoomState)
  Gamestate.switch(DevState, persistent)
end



state = Gamestate.current()

function state:update(dt)
    state.update(dt)
end

function state:draw(dt)
    state.draw(dt)
end

function love.keypressed(key)
    Gamestate.keypressed(key)
end

function love.keyreleased(key)
    Gamestate.keyreleased(key)
end

function love.mousepressed(mx, my, mbutton)
    Gamestate.mousepressed(mx, my, mbutton)
end

function love.mousereleased(mx, my, mbutton)
    Gamestate.mousereleased(mx, my, mbutton)
end

----------------------------------------- MENU ----------------------------------------------

