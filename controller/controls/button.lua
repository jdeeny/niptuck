local class = require 'lib.middleclass.middleclass'
local Control = require 'controller.controls.control'

local Button = class('MidiButton', Control)

function Button:initialize()
  Control.initialize(self)
  self.kind = 'button'
end

return Button
