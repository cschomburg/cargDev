--[[
	cargDev
]]
cargDev = {}
local cargDev = cargDev
local _G = getfenv()

function cargDev:RegisterModule(name, func, slashCmds)
	self[name:lower()] = func
	if(slashCmds) then
		name = "CARGDEBUG_"..(name:upper())
		SlashCmdList[name] = func
		for i, cmd in pairs(slashCmds) do
			_G["SLASH_"..name..i] = cmd
		end
	end
end

function cargDev:Print(formatStr, ...)
	print("|cffee8800cargDev: |r"..formatStr:format(...))
end

SlashCmdList["CARGDEBUG"] = function(realMsg)
	local name, msg = realMsg:match("^(.-)%s+(.*)$")
	if(not name) then
		name = realMsg
		msg = nil
	end
	if(not name) then return end
	name = name:lower()
	if(cargDev[name]) then
		cargDev[name](msg)
	else
		cargDev:Print("There is no module named '%s'!", name)
	end
end
SLASH_CARGDEBUG1 = "/cd"
SLASH_CARGDEBUG2 = "/cargdev"