--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

--slocal os = { getenv = os.getenv }
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


do
  local cmds =
  {
    "xfce4-power-manager",
    "nm-applet",
    "blueman-applet",
    --"kmix"
  }

  for _,i in pairs(cmds) do
    awful.util.spawn(i)
  end
end

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

-- klipper
awful.spawn.with_shell("sleep 2 && klipper")


local tasklist_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr,width,height, 5)
    gears.shape.transform(gears.shape.rounded_rect) : translate(0,25) (cr,width,height, 5)
end



local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark"
theme.wallpaper                                 = theme.dir .. "/1920x1080.jpg"--"/wall.png"
theme.awesome_icon                              = theme.dir .. "/icons//awesome.png"
theme.font                                      = "xos4 Terminus 9"
theme.fg_normal                                 = "#DDDDFF"
theme.fg_focus                                  = "#EA6F81"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#1A1A1A"
theme.bg_focus                                  = "#313131"
theme.bg_urgent                                 = "#1A1A1A"
theme.bg_systray                                = "#1A1A1A"
theme.border_width                              = 1
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#CC9393"
theme.tasklist_bg_focus                         = theme.bg_focus
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_normal
theme.menu_height                               = 16
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_spacing                          = 2
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_task_name                = false
theme.tasklist_disable_icon                     = false
theme.tasklist_shape                            = tasklist_shape
theme.tasklist_shape_border_color_focus         = theme.border_focus 
theme.tasklist_shape_border_width_focus         = 1
theme.tasklist_shape_border_color               = theme.border_normal
theme.tasklist_shape_border_width               = 0
theme.useless_gap                               = 0
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- Launcher
local mylauncher2 = awful.widget.button({image = theme.awesome_icon})
mylauncher2:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

local dockshape = function(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 6)
end

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R:%S'", 1,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
        widget:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"kdesu timeset-gui", ""})
          end)))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "xos4 Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " AC "))
                baticon:set_image(theme.widget_ac)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
        widget:buttons(my_table.join (
          awful.button({}, 4, function()
            run_once({"sudo xbacklight_set up", ""})
          end),
          awful.button({}, 5, function()
            run_once({"sudo xbacklight_set down", ""})
          end)))
    end
})
baticon:buttons(my_table.join (
  awful.button({}, 4, function()
    run_once({"sudo xbacklight_set up", ""})
  end),
awful.button({}, 5, function()
    run_once({"sudo xbacklight_set down", ""})
  end)
  ))


-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
        widget:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"xfce4-taskmanager", ""})
          end)))
    end
})
-- memicon:connect_signal("button::press", function() run_once({"htop",""}) end)
memicon:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"xfce4-taskmanager", ""})
          end)))

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
        widget.forced_width = 30
        widget:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"i-nex", ""})
          end)))
    end
})
cpuicon:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"i-nex", ""})
          end)))

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
        widget.forced_width = 50
        widget:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"gkrellm", ""})
          end)))
    end
})
tempicon:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"gkrellm", ""})
          end)))

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsabar({
    notification_preset = { font = "Monospace 12", fg = theme.fg_normal },
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        --widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end
})

volicon:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"pavucontrol", ""})
          end),
          awful.button({}, 2, function()
            os.execute(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
            theme.volume.notify()
          end),
          awful.button({}, 3, function()
            os.execute(string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel))
            theme.volume.notify()
          end),
          awful.button({}, 4, function()
            os.execute(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
            theme.volume.notify()
          end),
          awful.button({}, 5, function()
            os.execute(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
            theme.volume.notify()
          end)
))


-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
                          markup("#7AC82E", " " .. net_now.received)
                          .. " " ..
                          markup("#46A8C3", " " .. net_now.sent .. " ")))
        widget.forced_width = 100
        widget.align = "center"
    end
})

-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)

function theme.vertical_wibox(s)
    -- Create the vertical wibox
    s.dockheight = (80 *  s.workarea.height)/100

    s.myleftwibox = wibox({ screen = s, x=0, y=s.workarea.height/2 - s.dockheight/2, width = 1, height = s.dockheight, fg = theme.fg_normal, bg = barcolor2, ontop = true, visible = true, type = "dock" })

    if s.index > 1 and s.myleftwibox.y == 0 then
        s.myleftwibox.y = screen[1].myleftwibox.y
    end

    -- Add widgets to the vertical wibox
    s.myleftwibox:setup {
        layout = wibox.layout.align.vertical,
        {
            layout = wibox.layout.fixed.vertical,
            wibox.container.margin(mylauncher2, 5, 8, 13, 0),
        },
    }

    -- Add toggling functionalities
    s.docktimer = gears.timer{ timeout = 2 }
    s.docktimer:connect_signal("timeout", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = 1
        mylauncher2.visible = false
        if s.docktimer.started then
            s.docktimer:stop()
        end
    end)
    tag.connect_signal("property::selected", function(t)
        local s = t.screen or awful.screen.focused()
        s.myleftwibox.width = 38
        mylauncher2.visible = true
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
        if not s.docktimer.started then
            s.docktimer:start()
        end
    end)

    s.myleftwibox:connect_signal("mouse::leave", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = 1
        mylauncher2.visible = false
    end)

    s.myleftwibox:connect_signal("mouse::enter", function()
        local s = awful.screen.focused()
        s.myleftwibox.width = 38
        mylauncher2.visible = true
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
    end)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.util.tagnames = { "", "", "", "", "", "", "", "" }
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 18, bg = theme.bg_normal, fg = theme.fg_normal })

    systray = wibox.widget.systray()
    systray.forced_width = 150

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            systray,
            spr,
            --arrl_dl,
            mykeyboardlayout,
            volicon,
            theme.volume.widget,
            baticon,
            bat.widget,
            --arrl_dl,
            memicon,
            mem.widget,
            --arrl_ld,
            wibox.container.background(cpuicon, theme.bg_normal),
            wibox.container.background(cpu.widget, theme.bg_normal),
            --arrl_dl,
            tempicon,
            temp.widget,
            --arrl_ld,
            wibox.container.background(neticon, theme.bg_normal),
            wibox.container.background(net.widget, theme.bg_normal),
            --arrl_dl,
            clock,
            spr,
            --arrl_ld,
            wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
    }

    gears.timer.delayed_call(theme.vertical_wibox, s)
end

return theme
