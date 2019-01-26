local class = require 'lib.middleclass.middleclass'

local Manager = {}

local require = require 'util.require'

Manager.devices = require.tree('controller.devices')

return Manager
