--package.path = "../?.lua;" .. package.path

local Niptuck = {}

function Niptuck.update(dt)
  Niptuck.overlay:update(dt)
end

function Niptuck.draw()
  Niptuck.overlay:draw()
end


--Niptuck.xtouchmini = require 'xtouchmini'
Niptuck.overlay = require 'overlay'
return Niptuck
