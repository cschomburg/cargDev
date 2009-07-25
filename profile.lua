local funcString = [[
	local start = GetTime()
	local count = collectgarbage("count")
	for i=1, $iterations do
		$msg
	end
	cargDev:Print("%.3fs for %d iterations (used %.2fkb memory)", GetTime()-start, $iterations, collectgarbage("count")-count)
]]

local function time(msg)
	local iterations
	iterations, msg = msg:match("^(%x+)%s+(.*)$")
	local str = funcString:gsub("$iterations", iterations):gsub("$msg", msg)
	assert(loadstring(str))()
end
cargDev:RegisterModule("profile", time, {"/profile", "/pr"})