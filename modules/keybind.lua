local main_mod = "SUPER" -- Sets "Windows" key as main modifier
local shift = "SHIFT"
local plus = " + "

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"


function simple_mod(key) 
    return main_mod .. plus .. key
end

function shift_mod(key)
    return main_mod .. plus .. shift .. plus .. key
end


hl.bind(simple_mod("C"), hl.dsp.window.close())
hl.bind(simple_mod("Q"), hl.dsp.exec_cmd("kitty"))
hl.bind(shift_mod("P"), hl.dsp.exec_cmd("playctl play-pause"))
hl.bind(simple_mod("R"), hl.dsp.exec_cmd("hyprlauncher"))


-- change workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main_mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(main_mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
hl.bind(simple_mod("W"), hl.dsp.focus({ workspace = "-1" }))
hl.bind(simple_mod("S"),   hl.dsp.focus({ workspace = "+1" }))
hl.bind(simple_mod("grave"),   hl.dsp.workspace.toggle_special("special1"))

-- change window
hl.bind(simple_mod("A"), hl.dsp.layout("focus l"))
hl.bind(simple_mod("D"), hl.dsp.layout("focus r"))
hl.bind(simple_mod("I"), hl.dsp.layout("focus u"))
hl.bind(simple_mod("K"), hl.dsp.layout("focus d"))
hl.bind(simple_mod("J"), hl.dsp.layout("focus l"))
hl.bind(simple_mod("L"), hl.dsp.layout("focus r"))

-- move window
hl.bind(shift_mod("W"), hl.dsp.window.move({workspace = "-1"}))
hl.bind(shift_mod("S"), hl.dsp.window.move({workspace = "+1"}))
hl.bind(shift_mod("A"), hl.dsp.window.move({direction = "left"}))
hl.bind(shift_mod("D"), hl.dsp.window.move({direction = "right"}))

-- resize window
hl.bind(simple_mod("equal"), hl.dsp.window.resize({x = 20, y = 0, relative = true}))
hl.bind(simple_mod("minus"), hl.dsp.window.resize({x = -20, y = 0, relative = true}))
hl.bind(shift_mod("equal"), hl.dsp.window.resize({x = 0, y = 20, relative = true}))
hl.bind(shift_mod("minus"), hl.dsp.window.resize({x = 0, y = -20, relative = true}))
hl.bind(simple_mod("F"), hl.dsp.window.fullscreen({mode="fullscreen", action="toggle"}))
hl.bind(shift_mod("F"), hl.dsp.window.fullscreen({mode="maximized", action="toggle"}))

--
-- # bind = $mainMod, F, layoutmsg, fit active
--
--
-- # Move/resize windows with mainMod + LMB/RMB and dragging
-- bindm = $mainMod, mouse:272, movewindow
-- bindm = $mainMod, mouse:273, resizewindow
--
