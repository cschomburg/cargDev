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

color = {
	["function"] = "9090ff",
	["number"] = "00ff00",
	["nil"] = "ff5050",
	["table"] = "ee8800",
}

function debug(...)
	local strText
	for i=1, select("#", ...) do
		local value = select(i, ...)
		if(strText) then strText = strText..", " else strText = "" end
		strText = ("%s|cff%s%s|r"):format(strText, color[type(value)] or "ffffff", tostring(value))
	end
	debugFrame:AddMessage(strText)
end

cargDev:RegisterModule("debug", debug, {"/debug"})
cargDev:RegisterModule("debugclear", function() debugFrame:Clear() end, {"/debugclear", "/dcl"})