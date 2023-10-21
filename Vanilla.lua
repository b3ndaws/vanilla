--// Title: Vanilla.lua
--// Author: bendaws
--// Description: Vanilla configuration interpreter

local vl = {}
local buildVanillaIndex = {}

-- see if the file exists
local function vl.file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function vl.lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}

  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end

  return lines
end

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
		print("[VANILLA:ERROR@"..tostring(index).."]: vl.readline() catches variable lower than 0, this var cannot be called on")
	else
		table.insert(buildVanillaIndex, str1, str2)
	end
end

function vl.get(data: table, pointer: any)
	if table.find(buildVanillaIndex, pointer) then
		return table.find(buildVanillaIndex, pointer)
	end
end

function vl.read(filepath)
	if not vl.file_exists(filepath) then
		print("[VANILLA:ERROR@0]: The vanilla file you are calling on does not exist, or is unable to be opened.")
	elseif vl.file_exists(filepath) == not nil then
		for index, line in pairs(vl.lines_from(filepath)) do
			vl.readline(line, index)
		end
	end
end

return nil
