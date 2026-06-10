require("modules.desktop")

local main_mod = "SUPER" -- Sets "Windows" key as main modifier
local shift = "SHIFT"
local ctrl = "CTRL"
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

function ctrl_mod(key)
    return main_mod .. plus .. ctrl .. plus .. key
end

function shift_key(key)
    return shift .. plus .. key
end


hl.bind(simple_mod("Return"), hl.dsp.exec_cmd(terminal))
hl.bind(simple_mod("Space"), hl.dsp.exec_cmd(menu))
hl.bind(simple_mod("BackSpace"), hl.dsp.exec_cmd(fileManager))
hl.bind(simple_mod("C"), hl.dsp.window.close())
hl.bind(simple_mod("X"), hl.dsp.window.kill())
hl.bind(shift_mod("P"), hl.dsp.exec_cmd("playerctl play-pause"))


-- switch workspace and window
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main_mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(main_mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(simple_mod("W"), hl.dsp.focus({ workspace = "-1" }))
hl.bind(simple_mod("S"), hl.dsp.focus({ workspace = "+1" }))
hl.bind(simple_mod("A"), hl.dsp.layout("focus l"))
hl.bind(simple_mod("D"), hl.dsp.layout("focus r"))

-- swap window
hl.bind(shift_mod("W"), hl.dsp.window.move({workspace = "-1"}))
hl.bind(shift_mod("S"), hl.dsp.window.move({workspace = "+1"}))
hl.bind(shift_mod("A"), hl.dsp.window.swap({direction = "left"}))
hl.bind(shift_mod("D"), hl.dsp.window.swap({direction = "right"}))

-- special
hl.bind(simple_mod("grave"),   hl.dsp.workspace.toggle_special("secret"))
hl.bind(simple_mod("G"),   hl.dsp.workspace.toggle_special("game"))
hl.bind(simple_mod("B"),   hl.dsp.workspace.toggle_special("browser"))
hl.bind(shift_mod("grave"), hl.dsp.window.move({ workspace = "special:secret"}))
hl.bind(shift_mod("G"),   hl.dsp.window.move({ workspace = "special:game"}))
hl.bind(shift_mod("B"),   hl.dsp.window.move({ workspace = "special:browser"}))

-- change window
hl.bind(simple_mod("I"), hl.dsp.layout("focus u"))
hl.bind(simple_mod("K"), hl.dsp.layout("focus d"))
hl.bind(simple_mod("J"), hl.dsp.layout("focus l"))
hl.bind(simple_mod("L"), hl.dsp.layout("focus r"))

-- move window
hl.bind(shift_mod("I"), hl.dsp.window.move({direction = "up"}))
hl.bind(shift_mod("K"), hl.dsp.window.move({direction = "down"}))
hl.bind(shift_mod("J"), hl.dsp.window.move({direction = "left"}))
hl.bind(shift_mod("L"), hl.dsp.window.move({direction = "right"}))

-- resize window
hl.bind(ctrl_mod("R"), function()
    resize_style()
    hl.dispatch(hl.dsp.submap("resize"))
end)
hl.define_submap("resize", function()
    hl.bind("I", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })

    hl.bind(shift_key("I"), hl.dsp.window.resize({ x = 0, y = 100, relative = true}), { repeating = true })
    hl.bind(shift_key("K"), hl.dsp.window.resize({ x = 0, y = -100, relative = true}), { repeating = true })
    hl.bind(shift_key("L"), hl.dsp.window.resize({ x = 100, y = 0, relative = true}), { repeating = true })
    hl.bind(shift_key("J"), hl.dsp.window.resize({ x = -100, y = 0, relative = true}), { repeating = true })

    hl.bind("C", function() 
        default_style()
        hl.dispatch(hl.dsp.submap("reset"))
    end)
    hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind(simple_mod("equal"), hl.dsp.window.resize({x = 20, y = 0, relative = true}))
hl.bind(simple_mod("minus"), hl.dsp.window.resize({x = -20, y = 0, relative = true}))
hl.bind(shift_mod("equal"), hl.dsp.window.resize({x = 0, y = 20, relative = true}))
hl.bind(shift_mod("minus"), hl.dsp.window.resize({x = 0, y = -20, relative = true}))
hl.bind(simple_mod("F"), hl.dsp.window.fullscreen({mode="fullscreen", action="toggle"}))
hl.bind(shift_mod("F"), hl.dsp.window.fullscreen({mode="maximized", action="toggle"}))
