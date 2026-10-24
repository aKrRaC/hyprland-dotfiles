-- █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
-- █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄

-- Main Monitor
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@143.97",
    position = "1080x188",
    scale = "auto",
    bitdepth = 10,
    cm = "auto"
})

-- Secondary Monitor
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60.0",
    position = "0x0",
    scale = "auto",
    bitdepth = 10,
    cm = "auto",
    transform = 1
})

