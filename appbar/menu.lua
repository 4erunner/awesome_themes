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
local naughty       = require("naughty")

local pairs, string, table, os = pairs, string, table, os

local existent_paths = {}
table.insert(existent_paths, string.format("%s/Desktop", os.getenv("HOME")))
menu_gen.all_menu_dirs2 = existent_paths

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

local function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function menu.build()
    local res = {}
    local unique_entries = {}
    local dirs_parsed = 0
    local apps = {}
    apps['default'] = {}
    for _, dir in ipairs(menu_gen.all_menu_dirs2) do
        local paths = pipelines('find '..dir..' -maxdepth 1 -type f')
        for path in paths do
            if path:find("%.desktop$") then
                entry = menu_utils.parse_desktop_file(path)
                if entry and entry.Name and entry.cmdline then
                    if entry['categories'] ~= nil then if not apps[entry['categories'][1]] then apps[entry['categories'][1]] = {} end end
                    local unique_key = entry.Name .. '\0' .. entry.cmdline
                    if not unique_entries[unique_key] then
                        local name = menu_utils.rtrim(entry.Name) or ""
                        local cmdline = menu_utils.rtrim(entry.cmdline) or ""
                        local icon = entry.icon_path or nil
                        if entry['categories'] ~= nil then 
                            table.insert(apps[entry['categories'][1]], {name = name, cmdline = cmdline, icon = icon})
                        else
                            table.insert(apps['default'], {name = name, cmdline = cmdline, icon = icon})
                        end
                        unique_entries[unique_key] = true
                    end
                else
                    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Bad desctop file!",
                     text = string.format("path: %s", path) })

                end
            end
        end

        for k, v in spairs(apps) do
            for _, a in pairs(v) do
                wgt = wibox.widget.imagebox(a.icon)
                if a.cmdline:find(".*C:.*") then
                    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Bad desctop file!",
                     text = string.format("path: %s - change on linux path", a.cmdline) })
                end
                table.insert(res, { widget = wgt, cmdline = a.cmdline})
            end
        end
    end
    return res

end

return menu
