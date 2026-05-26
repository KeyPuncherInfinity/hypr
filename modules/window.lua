hl.window_rule({
    name = "no-blur",
    match = {
        class = "google-chrome",
    },
    opacity = 1.2,
})

hl.window_rule({
    name = "fullscreen",
    match={
        class = "com.moonlight_stream.Moonlight",
    },
    opacity = 2.0,
    fullscreen_state = 2,
})
