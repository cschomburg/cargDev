--[[
	cargDebug
]]
local addon = CreateFrame("ScrollingMessageFrame", nil, UIParent)
local _G = getfenv()

function addon:new()
	self:SetTimeVisible(300)
	self:SetInsertMode("BOTTOM")
	self:SetFrameStrata("HIGH")
	self:SetJustifyH("LEFT")
	self:SetHeight(540)
	self:SetWidth(400)
	self:SetMaxLines(24)
	self:SetPoint("TOPLEFT", UIParent, 10, -10)
	self:SetFontObject(ChatFontNormal)
	self:Show()
end
addon:new()

SlashCmdList['DEVCLEAR'] = function(...) return addon:Clear() end
SLASH_DEVCLEAR1 = '/devclear'
SLASH_DEVCLEAR2 = '/dcl'

addon.debug = function(...)
	local strText
	for i=1, select("#", ...) do
		if(strText) then strText = strText..", " else strText = "" end
		strText = strText..(select(i, ...) or "|cffff9090nil|r")
	end
	addon:AddMessage(strText)
end

--[[*****************************************
	Prints the name of the hovered frame and tries to Spew the entered command (use "frame" for the hovered frame)
*******************************************]]
SlashCmdList['FRAME'] = function(msg)
	frame = GetMouseFocus()
	if(SlashCmdList.SPEW and msg and strlen(msg)>0) then
		local firstLetter = msg:sub(1, 1)
		if(firstLetter == ":" or firstLetter == ".") then
			SlashCmdList.SPEW("frame"..msg)
		else
			SlashCmdList.SPEW(msg)
		end
	else
		addon.debug(frame:GetName())
	end
end
SLASH_FRAME1 = '/frame'

_G['debug'] = addon.debug
_G['cargDebug'] = addon