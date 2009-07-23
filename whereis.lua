local borders = {}

function WhereIs(frame)
	if(not frame) then return end
	if(not borders[frame]) then
		local border = CreateFrame("Frame", nil, UIParent)
		border:SetBackdrop{
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 16, edgeSize = 16,
			insets = {left = 4, right = 4, top = 4, bottom = 4},
		}
		border:SetFrameStrata("HIGH")
		border:SetFrameLevel(100)
		border:SetBackdropBorderColor(1, 0.5, 0.5, 1)
		border:SetAllPoints(frame)
		border:Hide()
		borders[frame] = border
	end
	ToggleFrame(borders[frame])
end

SlashCmdList['WHEREIS'] = function(frame)
	if(frame == "clear") then
		for _, v in pairs(borders) do v:Hide() end
		return
	end
	frame = assert(loadstring("return "..frame))()
	WhereIs(frame)
end
SLASH_WHEREIS1 = '/whereis'