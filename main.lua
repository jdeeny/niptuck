package.cpath = "lib/treble/lib/lovemidi/?.so;" .. package.cpath

local treble = require 'lib.treble'
local niptuck = require '.'


function love.load()
  print 'load'
end

function love.update(dt)
  niptuck:update(dt)
end

function love.draw()
  niptuck:draw()
end
