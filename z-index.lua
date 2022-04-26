function enum( t )
	local result = {}

	for index, name in pairs(t) do
		result[name] = index
	end

	return result
end

layers = enum({
	"background",
	"character",
	"dialogue",
	"menu"
})