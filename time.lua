local funcString = [[
	local start = GetTime()
	for i=1, $iterations do
		$msg
	end
	cargDebug:Print("%.3fs for %d iterations", GetTime()-start, $iterations)
]]

local function time(msg)
	local iterations
	iterations, msg = msg:match("^(%x+)%s+(.*)$")
	local str = funcString:gsub("$iterations", iterations):gsub("$msg", msg)
	assert(loadstring(str))()
end
cargDebug:RegisterModule("time", time, {"/time"})