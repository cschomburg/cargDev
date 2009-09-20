--[[*****************************************
	Prints the name of the hovered frame and tries to Spew the entered command (use "frame" for the hovered frame)
*******************************************]]
local function getFrame(msg)
	frame = GetMouseFocus()
	if(Spew and msg) then
		local firstLetter = msg:sub(1, 1)
		if(firstLetter == ":" or firstLetter == ".") then
			Spew("frame"..msg)
		else
			Spew(msg)
		end
	else
		cargDev:Print(frame:GetName() or tostring(frame))
	end
end
cargDev:RegisterModule("Frame", getFrame, {"/frame"})