--package.path = "../?.lua;" .. package.path
local Niptuck = {
  controller = require('controller'),
  overlay = require('overlay'):new()
}

function Niptuck.update(dt)
  Niptuck.overlay:update(dt)
end

function Niptuck.draw()
  Niptuck.overlay:draw()
end

return Niptuck
