--[[*****************************************
	Prints the name of the hovered frame and tries to Spew the entered command (use "frame" for the hovered frame)
*******************************************]]
local function frame(msg)
	frame = GetMouseFocus()
	if(SlashCmdList.SPEW and msg and strlen(msg)>0) then
		local firstLetter = msg:sub(1, 1)
		if(firstLetter == ":" or firstLetter == ".") then
			SlashCmdList.SPEW("frame"..msg)
		else
			SlashCmdList.SPEW(msg)
		end
	else
		cargDebug.debug(frame:GetName())
	end
end
cargDebug:RegisterModule("Frame", frame, {"/frame"})