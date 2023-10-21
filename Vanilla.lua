--// Title: Vanilla.lua
--// Author: bendaws
--// Description: Vanilla configuration interpreter

local vl = {}
local buildVanillaIndex = {}

local function vl.readline(str: string, index: number)
	local index_pointer_str = str.split(str, "")
	if index_pointer_str[1] == "/" and index_pointer_str[2] == "/" then return nil end
	if index_pointer_str[1] == "!" then return nil end -- ! is a warning in Vanilla. not much more, just a slightly more shocking comment.
	
	local str_defn_spaces = string.gsub(str, " ", "")
	local str_defn_colon = string.split(str_defn_spaces, ":")

	local str1 = str_defn_colon[1]
	local str2 = str_defn_colon[2]

	if string.length(str1) <= 0 then
		-- err
		print("[VANILLA:ERROR@"..tostring(index).."]: vl.readline() catches variable lower than 0, this var cannot be called on"
	else
		table.insert(buildVanillaIndex, str1, str2)
	end
end

function vl.get(data: table, pointer: any)
	return nil
end
