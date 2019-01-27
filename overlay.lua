package.path = "../?.lua;" .. package.path

local class = require 'lib.middleclass.middleclass'

local Overlay = class('MidiOverlay')

local OVERLAY_WIDTH = 9/10
local OVERLAY_HEIGHT = 1/5
local OVERLAY_PAD = 1/32
local OVERLAY_TITLE_HEIGHT = 1/4
local OVERLAY_BODY_HEIGHT = 1/8
local OVERLAY_ROUNDING = 1/64
local READOUT_HEIGHT = 1/4
local READOUT_WIDTH =  5/8


function Overlay:initialize()
  self:refresh()
end

function Overlay:refresh()
  self:_refresh_sizes()
  self:_refresh_fonts()
end

local function center(x1, x2)
  return (x1+x2) / 2
end

function Overlay:_refresh_sizes()
  local w, h = love.graphics.getDimensions()
  self.w, self.h = w, h
  self.sizes = {}
  self.sizes.overlay = {
    w = w * OVERLAY_WIDTH,
    h = h * OVERLAY_HEIGHT,
    x = w * (1-OVERLAY_WIDTH) / 2,
    y = h * (1 - OVERLAY_HEIGHT - OVERLAY_PAD),
  }
  self.sizes.overlay.corners = (self.sizes.overlay.w + self.sizes.overlay.h) / 2 * OVERLAY_ROUNDING

  self.sizes.content = {
    w = self.sizes.overlay.w - 2 * OVERLAY_PAD,
    h = self.sizes.overlay.h - 2 * OVERLAY_PAD,
    x = self.sizes.overlay.x + OVERLAY_PAD,
    y = self.sizes.overlay.y + OVERLAY_PAD,
  }
  self.sizes.text = {
    title = self.sizes.content.h * OVERLAY_TITLE_HEIGHT,
    body = self.sizes.content.h * OVERLAY_BODY_HEIGHT,
  }
  self.sizes.readout = {
    w = self.sizes.content.w * READOUT_WIDTH,
    h = self.sizes.content.h * READOUT_HEIGHT,
  }

end

function Overlay:_refresh_fonts()
  self.fonts = {
    title = love.graphics.newFont(self.sizes.text.title, 'normal'),
    body = love.graphics.newFont(self.sizes.text.body, 'normal'),
  }
end



function Overlay:update(dt)
  if self.w ~= love.graphics.getWidth() or self.h ~= love.graphics.getHeight() then
    self:refresh()
  end
end

function Overlay:draw()
  love.graphics.setColor(0.05, 0.05, 0.05, 0.9)
  local overlay = self.sizes.overlay
  love.graphics.rectangle('fill', overlay.x, overlay.y, overlay.w, overlay.h, overlay.corners, overlay.corners)
  love.graphics.setColor(0.9, 0.9, 0.9, 1.0)
  love.graphics.setFont(self.fonts.title)
  love.graphics.printf("A title", self.sizes.content.x, self.sizes.content.y, self.sizes.content.w, 'center')
  love.graphics.setFont(self.fonts.body)
  love.graphics.printf("Testing", self.sizes.content.x, self.sizes.content.y + self.sizes.text.title * 2, self.sizes.content.w, 'center')
end

return Overlay
