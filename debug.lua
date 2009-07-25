local debugFrame = CreateFrame("ScrollingMessageFrame", nil, UIParent)

debugFrame:SetTimeVisible(300)
debugFrame:SetInsertMode("BOTTOM")
debugFrame:SetFrameStrata("HIGH")
debugFrame:SetJustifyH("LEFT")
debugFrame:SetHeight(540)
debugFrame:SetWidth(400)
debugFrame:SetMaxLines(24)
debugFrame:SetPoint("TOPLEFT", UIParent, 10, -10)
debugFrame:SetFontObject(ChatFontNormal)
debugFrame:Show()

local debug = function(...)
	local strText
	for i=1, select("#", ...) do
		if(strText) then strText = strText..", " else strText = "" end
		strText = strText..(select(i, ...) or "|cffff9090nil|r")
	end
	debugFrame:AddMessage(strText)
end
_G['debug'] = debug

cargDev:RegisterModule("debug", debug, {"/debug"})
cargDev:RegisterModule("debugclear", function() debugFrame:Clear() end, {"/debugclear", "/dcl"})