package.path = "../?.lua;" .. package.path

local Niptuck = {}

Niptuck.xtouchmini = require 'xtouchmini'
Niptuck.overlay = require 'overlay'
return Niptuck
