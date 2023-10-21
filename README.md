# Vanilla
Vanilla is a basic configuration file interpreter built for Lua applications as an alternative to JSON. It features:
- A very basic syntax
- Fast read times
- Table -> Vanilla, Vanilla -> Table conversions
- And other small features for a better experience

## Current limitations

- Cannot have spaces in answers to variables
- Does not support sets of data (tables)

## Use Vanilla on your Lua project
Download the ``vanilla.lua`` interpreter as a module and use the ``.read(filepath)`` function to read files. It will be converted into a special type of
tabledata, which you can grab a specific property from by using ``vanilla.get(vanilla_data, property)``. It will return ``nil`` if not completed.

## Example
Vanilla (``_config.vl``):
```
version: 2.0.3
name: Ben
// A comment in Vanilla
my_birthday: 10-20-23
```

Lua (``reading_configvanilla.lua``):
```lua
local vl = require("Vanilla.lua")
local config = vl.read("My_Project_Directory/_config.vl")

-- Look for "name" value
local name = vl.get(config, "name")
print(name) -- Prints "Ben"
```
