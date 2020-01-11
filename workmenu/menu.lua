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
table.insert(existent_paths, string.format("%s/Workmenu", os.getenv("HOME")))
menu_gen.all_menu_dirs = existent_paths

-- Expecting a wm_name of awesome omits too many applications and tools
menu_utils.wm_name = ""

-- Menu
-- freedesktop.menu
local menu = {}


function menu.build()
    local res = {}

    return res

end

return menu
