--package.path = "../?.lua;" .. package.path
local Niptuck = {
  controller = require('controller'),
}

function Niptuck.update(dt)
  Niptuck.overlay:update(dt)
end

function Niptuck.draw()
  Niptuck.overlay:draw()
end


--Niptuck.xtouchmini = require 'xtouchmini'
Niptuck.overlay = require('overlay'):new()
return Niptuck
