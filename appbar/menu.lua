--[[

     Awesome-Freedesktop
     Freedesktop.org compliant desktop entries and menu

     Menu section

     Licensed under GNU General Public License v2
      * (c) 2016, Luke Bonham
      * (c) 2014, Harvey Mittens

--]]

local menu_gen   = require("menubar.menu_gen")
local menu_utils = require("menubar.utils")
local icon_theme = require("menubar.icon_theme")
local gls        = require("gears.filesystem")
local gears      = require("gears")
local wibox      = require("wibox")
local awful      = require("awful")

local pairs, string, table, os = pairs, string, table, os

local existent_paths = {}
table.insert(existent_paths, string.format("%s/Desktop", os.getenv("HOME")))
menu_gen.all_menu_dirs = existent_paths

-- Expecting a wm_name of awesome omits too many applications and tools
menu_utils.wm_name = ""

-- Menu
-- freedesktop.menu
local menu = {}

local function pipelines(...)
    local f = assert(io.popen(...))
    return function ()
        local data = f:read()
        if data == nil then f:close() end
        return data
    end
end

function menu.build()
    local res = {}
    local unique_entries = {}
    local dirs_parsed = 0

    for _, dir in ipairs(menu_gen.all_menu_dirs) do
        local paths = pipelines('find '..dir..' -maxdepth 1 -type f')
        for path in paths do
            if path:find("%.desktop$") then
                entry = menu_utils.parse_desktop_file(path)
                if entry.show and entry.Name and entry.cmdline then
                    local unique_key = entry.Name .. '\0' .. entry.cmdline
                    if not unique_entries[unique_key] then
                        local name = menu_utils.rtrim(entry.Name) or ""
                        local cmdline = menu_utils.rtrim(entry.cmdline) or ""
                        local icon = entry.icon_path or nil
                        wgt = wibox.widget.imagebox(icon)
                        if cmdline:find(".*C:.*") then
                            cmdline = cmdline:gsub("\\\\", '\\')
                            gears.debug.dump(cmdline)

                        end
                        wgt:buttons(awful.button({ }, 1, nil, function()
                            awful.spawn.with_shell(cmdline)
                            end
                            ))
                        table.insert(res, wgt)
                        unique_entries[unique_key] = true
                    end
                end
            end
        end
    end
    return res

end

return menu
