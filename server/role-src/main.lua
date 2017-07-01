local core = require "silly.core"
local channel = require "channel"
local db = require "db"
local rpccmd = require "protocol.rpc"
local tool = require "tool"
local unpack = string.unpack

require "role"

local slaveid = 1
local slavetype = "role"

local EVENT = {
	connected = function(gateid)
	end,
	close = function(gateid)
	end,
}

core.start(function()
	local l = tool.hublist()
	for k, v in pairs(l) do
		print(string.format("[role] gateid:%s port:%s", k, v))
	end
	channel.start {
		channelid = 1,
		channeltype = "role",
		hublist = l,
		event = EVENT,
		rpccmd = rpccmd,
	}
	local ok = db.start()
	print("[role] server start", ok)
end)

