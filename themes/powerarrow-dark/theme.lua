--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local appbar = require("appbar")
local naughty = require("naughty")

--slocal os = { getenv = os.getenv }
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

os.setlocale(os.getenv("LANG")) -- to localize the clock

do
  local cmds =
  {
    "xfce4-power-manager",
    "nm-applet",
    "blueman-applet",
    "xcompmgr -nC"
    --"kmix"
  }

  for _,i in pairs(cmds) do
    awful.spawn.with_shell(i)
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
    --gears.shape.rounded_rect(cr,width,height, 5)
    --gears.shape.transform(gears.shape.rounded_rect) : translate(0,25) (cr,width,height, 5)
    gears.shape.octogon(cr,width, height, height/ 3.5)
    gears.shape.transform(gears.shape.octogon) : translate(0, 25) (cr,width, height)
end

local xcomp = false

awful.spawn.with_line_callback(os.getenv("HOME") .. "/.config/awesome/xcomp.sh", {
stdout = function(line)
    gears.debug.dump(line)
    if line == "1" then
      xcomp = true
    end
end
})


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
theme.widget_sep                                = theme.dir .. "/icons/sep.png"
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
    -- gears.shape.partially_rounded_rect(cr, width, height, false, true, true, false, 6)
    gears.shape.octogon(cr,width, height, height/ 5)
    gears.shape.transform(gears.shape.octogon) : translate(0, 25) (cr,width, height)
end

local function notify_bar(procent)
    preset = { font = "Monospace 12", fg = theme.fg_normal }
    preset.title = string.format("%s - %s%%", "backlight", procent)

    -- -- tot is the maximum number of ticks to display in the notification
    -- -- fallback: default horizontal wibox height
    local wib, tot = awful.screen.focused().mywibox, 20

    -- -- if we can grab mywibox, tot is defined as its height if
    -- -- horizontal, or width otherwise
    if wib then
        if wib.position == "left" or wib.position == "right" then
            tot = wib.width
        else
            tot = wib.height
        end
    end

    int = math.modf((procent / 100) * tot)
    preset.text = string.format("[%s%s]", string.rep("|", int),
                  string.rep(" ", tot - int))

    preset.screen = awful.screen.focused()

    if not notification then
      notification = naughty.notify {
            preset  = preset,
            destroy = function() notification = nil end
        }
    else 
      naughty.replace_text(notification, preset.title, preset.text)
    end
end


-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R:%S'", 1,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
        widget:buttons(my_table.join (
                    awful.button({}, 1, function()
            run_once({"korganizer", ""})
          end),
          awful.button({}, 3, function()
            run_once({"kdesu timeset-gui", ""})
          end)
          ))
    end
)

-- Weather
theme.weather = lain.widget.weather({
    city_id = 523750, -- NChelny
    weather_na_markup = "", 
    notification_preset = { font = "Monospace 10" },
    lang = "ru",
    settings = function()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(" " .. markup.font(theme.font, units .. "°C") .. " ")
    end
})

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
                naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Warning!",
                     text = "Battery is EMPTY" })
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
                naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Warning!",
                     text = "Battery is LOW" })
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
            awful.spawn.with_line_callback("sudo xbacklight_set", {
            stdout = function(line)
                notify_bar(line)
            end
            })
            end),
            awful.button({}, 5, function()
            run_once({"sudo xbacklight_set down", ""})
            awful.spawn.with_line_callback("sudo xbacklight_set", {
            stdout = function(line)
                notify_bar(line)
            end
            })
          end)))
    end
})
baticon:buttons(my_table.join (
  awful.button({}, 4, function()
    run_once({"sudo xbacklight_set up", ""})
    awful.spawn.with_line_callback("sudo xbacklight_set", {
    stdout = function(line)
        notify_bar(line)
    end
    })
  end),
awful.button({}, 5, function()
    run_once({"sudo xbacklight_set down", ""})
    awful.spawn.with_line_callback("sudo xbacklight_set", {
    stdout = function(line)
        notify_bar(line)
    end
    })
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


local bbswwitch = wibox.widget.textbox()


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

local locdisplay = wibox.widget.textbox()
locdisplay.font = "xos4 Terminus 10"
locdisplay.markup =markup('red'  , '')
locdisplay:buttons(my_table.join (
          awful.button({}, 1, function()
            run_once({"/usr/bin/dm-tool switch-to-greeter", ""})
          end)))
-- Separators
-- local spr     = wibox.widget.textbox()
-- spr.font = "xos4 Terminus 18"
-- spr.markup =markup(theme.border_focus , '][')
local spr = wibox.widget.imagebox(theme.widget_sep)
-- local spr_l     = wibox.widget.textbox()
-- spr_l.font = "xos4 Terminus 18"
-- spr_l.markup =markup(theme.border_focus , '[')
-- local spr_r     = wibox.widget.textbox()
-- spr_r.font = "xos4 Terminus 18"
-- spr_r.markup =markup(theme.border_focus , ']')

function theme.vertical_wibox(s)
    -- Create the vertical wibox
    -- s.dockheight = (80 *  s.workarea.height)/100

    if s.appmenu == nil then
      s.appmenu = appbar.menu.build()
    end

    s.dockwidth = (#s.appmenu * 42) 
    s.dockheight = s.geometry.height

    -- s.myleftwibox = wibox({ screen = s, x=0, y=s.workarea.height/2 - s.dockheight/2, width = 1, height = s.dockheight, fg = theme.fg_normal, bg = barcolor2, ontop = true, visible = true, type = "dock" })

    s.myleftwibox = wibox({ 
      screen = s, 
      x=s.workarea.width/2 - s.dockwidth/2, 
      y=s.dockheight-1, 
      width = s.dockwidth, 
      height = 1, 
      fg = theme.fg_normal, 
      bg = theme.bg_normal, 
      ontop = true, 
      visible = true, 
      type = "dock"})

    if s.index > 1 then
        -- s.myleftwibox.y = screen[1].myleftwibox.y
        s.myleftwibox.y = screen[1].myleftwibox.y
        s.myleftwibox.x = s.myleftwibox.x + (s.workarea.width - s.dockwidth)/2
    end
    


    -- bar = {layout = wibox.layout.fixed.vertical}
    bar = {layout = wibox.layout.fixed.horizontal}
    table.insert(bar, wibox.container.margin(mylauncher2, 8, 8, 8, 8))

    for _, app in pairs(s.appmenu) do
        appcont = wibox.container.margin(app.widget, 8, 8, 8, 8)
        appcont:buttons(awful.button({ }, 1, nil, function()
          awful.spawn.with_shell(app.cmdline)
          end
        ))
        appcont:connect_signal ("mouse::enter", function(cont)
          cont.margins = 0
        end)
        appcont:connect_signal ("mouse::leave", function(cont)
          cont.margins = 8
        end)
         appcont:connect_signal ("button::press", function(cont)
          cont.margins = 10
        end)
        appcont:connect_signal ("button::release", function(cont)
          cont.margins = 0
        end)
        table.insert(bar, appcont)
    end

    -- Add widgets to the vertical wibox
    s.myleftwibox:setup {
        -- layout = wibox.layout.align.vertical,
        layout = wibox.layout.fixed.horizontal,
        bar,
    }

    -- Add toggling functionalities
    s.docktimer = gears.timer{ timeout = 5 }
    s.docktimer:connect_signal("timeout", function()
        local s = awful.screen.focused()
        s.myleftwibox.height = 1
        s.myleftwibox.y = s.dockheight - 1
        --mylauncher2.visible = false
        if s.docktimer.started then
            s.docktimer:stop()
        end
    end)
    tag.connect_signal("property::selected", function(t)
        local s = t.screen or awful.screen.focused()
        -- s.myleftwibox.width = 38
        -- mylauncher2.visible = true
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
        if not s.docktimer.started then
            s.docktimer:start()
        end
    end)

    s.myleftwibox:connect_signal("mouse::leave", function()
        local s = awful.screen.focused()
        -- s.myleftwibox.width = 1
        s.myleftwibox.height = 1
        s.myleftwibox.y = s.dockheight - 1 
        --mylauncher2.visible = false
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
        if not s.docktimer.started then
            s.docktimer:start()
        end
    end)

    s.myleftwibox:connect_signal("mouse::enter", function()
        local s = awful.screen.focused()
        local bg_opacity = ""
        if xcomp then
          bg_opacity = "88"
        end
        s.myleftwibox.bg = theme.bg_normal .. bg_opacity
        s.myleftwibox.height = 40
        s.myleftwibox.y = s.dockheight - 40
        gears.surface.apply_shape_bounding(s.myleftwibox, dockshape)
       if s.docktimer.started then
            s.docktimer:stop()
        end
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
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 18, bg = theme.bg_normal , fg = theme.fg_normal })

    local panel = {}

    if s.index == 1 then
      systray = wibox.widget.systray()
      systray.forced_width = 150
      panel = { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            systray,
            spr,
            mykeyboardlayout,
            spr,
            volicon,
            theme.volume.widget,
            baticon,
            bat.widget,
            memicon,
            mem.widget,
            cpuicon, 
            cpu.widget, 
            tempicon,
            temp.widget,
            bbswwitch,
            neticon,
            net.widget,
            spr,
            locdisplay,
            spr,
            theme.weather.icon,
            theme.weather.widget,
            clock,
            spr,
            s.mylayoutbox,

        }
    else       panel = { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            mykeyboardlayout,
            spr,
            volicon,
            theme.volume.widget,
            baticon,
            bat.widget,
            memicon,
            mem.widget,
            cpuicon, 
            cpu.widget, 
            tempicon,
            temp.widget,
            bbswwitch,
            neticon, 
            net.widget,
            spr,
            locdisplay,
            spr,
            theme.weather.icon,
            theme.weather.widget,
            clock,
            spr,
            s.mylayoutbox,

        }
    end

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            spr,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        panel,
    }

    gears.timer.delayed_call(theme.vertical_wibox, s)

    -- gears.timer {
    -- timeout   = 60,
    -- autostart = true,
    -- callback  = function()
    --     -- You should read it from `/sys/class/power_supply/` (on Linux)
    --     -- instead of spawning a shell. This is only an example.
    --     local bg_opacity = ""
    --     if xcomp then
    --       bg_opacity = "88"
    --     end
    --     s.mywibox.bg = theme.bg_normal .. bg_opacity
    -- end
    -- }

    gears.timer {
    timeout   = 5,
    autostart = true,
    callback  = function()
        -- You should read it from `/sys/class/power_supply/` (on Linux)
        -- instead of spawning a shell. This is only an example.
        awful.spawn.with_line_callback(os.getenv("HOME") .. "/.config/awesome/bbswitch.sh", {
        stdout = function(line)
            if line == "1" then
              bbswwitch.markup = markup('red', '')
            else
              bbswwitch.markup = markup('red', '')
            end
        end
        })
    end
    }
 

end

return theme
