-- █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
-- █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄

-- Main Monitor
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@143.97",
    position = "1080x188",
    scale = "1.0",
    bitdepth = 10
})

-- Secondary Monitor
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60.0",
    position = "0x0",
    scale = "1.0",
    transform = 1
})
