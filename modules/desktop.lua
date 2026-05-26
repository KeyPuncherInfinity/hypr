hl.config({
    general = {
        gaps_in = 2, 
        gaps_out = {
            top = 34,
            left = 10,
            right = 10,
            bottom = 10,
        },
        float_gaps = 10,
        border_size = 1,

        col = {
            active_border = 0xFFFF0000,
            -- inactive_border = rgba(595959aa),
        },
        resize_on_border = false,
        allow_tearing = false,
    }
})

hl.config({ 
    decoration = {
        rounding = 8,
        rounding_power = 5,

        -- # Change transparency of focused and unfocused windows
        active_opacity = 0.85,
        inactive_opacity = 0.6,

        shadow = {
            enabled = true,
            range = 5,
            render_power = 4,
            -- color = rgba(1a1a1aee)
        },

        blur = {
            enabled = true,
            size = 6,
            passes = 2,

            vibrancy = 4.0,
        }
    }
})
