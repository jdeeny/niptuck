package.cpath = "lib/treble/lib/lovemidi/?.so;" .. package.cpath

local treble = require 'lib.treble'
local niptuck = require '.'


rect = {
    x = 100,
    color = { 1, 0, 0, 1},
    flashing = false,
    _controllable = {
        jumpPower = {
            type = 'number',
            min = 1,
            max = 1280,
        },
        color = {
          type = 'event',
          fn = function() end,
        },
        flashing = {
          type = 'toggle',
          states = { false, true },
        }
    },
}

--niptuck:addTarget(rect)
--niptuck:addController('xtouch')

function love.load()
  --niptuck.addTarget(rect)
  print 'load'
end

function love.update(dt)
  niptuck:update(dt)
end

function love.draw()
  niptuck:draw()
end
