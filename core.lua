--[[
	cargDebug
]]
cargDebug = {}
local cargDebug = cargDebug
local _G = getfenv()

function cargDebug:RegisterModule(name, func, slashCmds)
	cargDebug[name:lower()] = func
	if(slashCmds) then
		name = "CARGDEBUG_"..(name:upper())
		SlashCmdList[name] = func
		for i, cmd in pairs(slashCmds) do
			_G["SLASH_"..name..i] = cmd
		end
	end
end

function cargDebug:Print(formatStr, ...)
	print("|cffee8800cargDebug: |r"..formatStr:format(...))
end

SlashCmdList["CARGDEBUG"] = function(realMsg)
	local name, msg = realMsg:match("^(.-)%s+(.*)$")
	if(not name) then
		name = realMsg
		msg = nil
	end
	if(not name) then return end
	name = name:lower()
	if(cargDebug[name]) then
		cargDebug[name](msg)
	else
		cargDebug:Print("There is no module named '%s'!", name)
	end
end
SLASH_CARGDEBUG1 = "/cd"
SLASH_CARGDEBUG2 = "/cargdebug"