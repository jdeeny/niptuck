package.path = "../?.lua;" .. package.path

local class = require 'lib.middleclass.middleclass'

local Overlay = class('MidiOverlay')

function Overlay:initialize(font)
  self.font = font or require('roboto')
end

function Overlay:update(dt)

end

function Overlay:draw()
  love.graphics.setColor(0.01, 0.01, 0.01, 0.85)
  love.graphics.rectangle('fill', 800, 500, 300, 200, 16, 16)
  love.graphics.setColor(0.9, 0.9, 0.9, 1.0)
  love.graphics.printf("Text", 800, 540, 300, 'center')

end

return Overlay
