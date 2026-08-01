-- █▀▀ ▀▄▀ █▀▀ █▀▀
-- ██▄ █░█ ██▄ █▄▄
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("hyprctl setcursor Layan-white-cursors 24")
    hl.exec_cmd("swaybg -m fill -i ~/.config/wallpaper/background.png")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")

    -- Clipboard
    hl.exec_cmd("wl-clipboard-history -t")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- GTK Theme
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"TokyoNight\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
end)

-- █▀▀ █▄░█ █░█ █ █▀█ █▀█ █▄░█ █▀▄▀█ █▀▀ █▄░█ ▀█▀  █░█ ▄▀█ █▀█ █ ▄▀█ █▄▄ █░░ █▀▀ █▀
-- ██▄ █░▀█ ▀▄▀ █ █▀▄ █▄█ █░▀█ █░▀░█ ██▄ █░▀█ ░█░  ▀▄▀ █▀█░█▀▄ █ █▀█░█▄█ █▄▄ ██▄ ▄█
-- QT specific environment variables
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Fix screen sharing issues
hl.env("bitdepth", "10")

-- █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
-- █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄
require("./monitors")
require("./workspaces")

-- █ █▄░█ █▀█ █░█ ▀█▀
-- █ █░▀█ █▀▀ █▄█ ░█░
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", mods = "ALT", action = "close" })
hl.gesture({ fingers = 3, direction = "up", mods = "SUPER", scale = 1.5, action = "fullscreen" })

-- █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀
-- █▄▄ █▄█ █░▀█ █▀░ █ █▄█
hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0 -- -1.0 - 1.0, 0 means no modification.
    },
    -- █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ █░░
    -- █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ █▄▄
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 0,
        layout = "dwindle"
    },
    -- █▀▄▀█ █ █▀ █▀▀
    -- █░▀░█ █ ▄█ █▄▄
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = false,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        enable_swallow = true,
        swallow_regex = "^(kitty)$"
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true
    },
    -- █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█  █▀▄ █▀▀ █▀▀ █▀█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
    -- ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀  █▄▀ ██▄ █▄▄ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█
    decoration = {
        -- Rounded coner
        rounding = 8,
        -- Opacity
        active_opacity = 0.9,
        inactive_opacity = 0.9,
        -- Blur
        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            popups = true
        },
        -- Shadows
        shadow = {
            enabled = true,
            range = 4,
            render_power = 2,
            color = "rgba(1a1a1aee)"
        },
    },
    -- Animations
    animations = {
        enabled = true
    },
    -- Layout
    dwindle = {
        preserve_split = true
    },
    -- █▀▀ █▀█ █▀█ █░█ █▀█ █▀
    -- █▄█ █▀▄ █▄█ █▄█ █▀▀ ▄█
    group = {
        groupbar = {
            rounding = 8,
            gradients = true,
            gradient_rounding = 8,
            height = 26,
            font_size = 14,
            text_padding = 4,
            blur = true,
            col = {
                active = 0xFF565F89,
                inactive = 0xFF3B4261,
                locked_active = 0xFFE0AF68,
                locked_inactive = 0xFF6B5A3A
            }
        }
    }
})

-- █▄▄ █▀▀ ▀█ █ █▀▀ █▀█   █▀▀ █░█ █▀█ █░█ █▀▀
-- █▄█ ██▄ █▄ █ ██▄ █▀▄   █▄▄ █▄█ █▀▄ ▀▄▀ ██▄
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })

-- ▄▀█ █▄░█ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█ █▀
-- █▀█ █░▀█ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█ ▄█
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "smoothOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "smoothIn" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 10, bezier = "smoothIn" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- █░░ ▄▀█ █▄█ █▀▀ █▀█   █▀█ █░█ █░░ █▀▀ █▀
-- █▄▄ █▀█░ █░ ██▄ █▀▄   █▀▄ █▄█ █▄▄ ██▄ ▄█
hl.layer_rule({match = { namespace = "gtk-layer-shell" }, blur = true })
hl.layer_rule({match = { namespace = "lockscreen" }, blur = true })
hl.layer_rule({match = { namespace = "rofi" }, blur = true })
hl.layer_rule({match = { namespace = "notifications" }, blur = true })
hl.layer_rule({match = { namespace = "logout_dialog" }, blur = true })

-- █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
-- ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█
hl.window_rule({match = { class = "^file_progress$" }, float = true, center = true})
hl.window_rule({match = { class = "^confirm$" }, float = true, center = true})
hl.window_rule({match = { class = "^dialog$" }, float = true, center = true})
hl.window_rule({match = { class = "^download$" }, float = true, center = true})
hl.window_rule({match = { class = "^error$" }, float = true, center = true})
hl.window_rule({match = { class = "^title:Open File$" }, float = true, center = true})
hl.window_rule({match = { class = "^title:branchdialog$" }, float = true, center = true})
hl.window_rule({match = { class = "^notification$" }, float = true})
hl.window_rule({match = { class = "^splash$" }, float = true})
hl.window_rule({match = { class = "^confirmreset$" }, float = true})
hl.window_rule({match = { class = "^Lxappearance$" }, float = true})
hl.window_rule({match = { class = "^feh$" }, float = true})
hl.window_rule({match = { class = "^pavucontrol$" }, float = true})
hl.window_rule({match = { class = "^pavucontrol-qt$" }, float = true})
hl.window_rule({match = { class = "^file-roller$" }, float = true})
hl.window_rule({match = { class = "^(Media viewer)$" }, float = true})
hl.window_rule({match = { class = "^Rofi$" }, float = true, animation = "none"})
hl.window_rule({match = { class = "^viewnior$" }, float = true, size = "1590 930"})
hl.window_rule({match = { class = "^blueman-manager$" }, float = true, size = "1080 680"})
hl.window_rule({match = { class = "^Cider$" }, float = true, size = "1590 930"})
hl.window_rule({match = { class = "^org.kde.kdeconnect.app$" }, float = true, size = "900 740"})
hl.window_rule({match = { class = "^wlogout$" }, fullscreen = true})
hl.window_rule({match = { class = "^mpv$" }, idle_inhibit = "focus"})
hl.window_rule({match = { fullscreen = true }, idle_inhibit = "fullscreen"})
hl.window_rule({match = { class = "^gamescope$" }, fullscreen = true})
hl.window_rule({match = { class = "^()$" }, no_blur = true})
hl.window_rule({
    name = "Picture-in-Picture",
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
    move = "72% 7%",
    pin = true,
    keep_aspect_ratio = true,
    opacity = "0.95 0.75",
    size = "(monitor_w*0.3) (monitor_h*0.3)",
})
hl.window_rule({
    name = "Volume-Control",
    match = {
        title = "^(Volume Control)$",
    },
    float = true,
    size = "1080 680",
    move = "75% 44%",
})

-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀
hl.bind("SUPER + X", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nemo"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("brave-origin"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("zeditor"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("cider"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 1000+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 1000-"), { repeating = true })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("wlogout --protocol layer-shell -P DP-1 -b 5 -T 550 -B 550"))


-- █▀▄▀█ █░█ █░░ ▀█▀ █ █▀▄▀█ █▀▀ █▀▄ █ ▄▀█
-- █░▀░█ █▄█ █▄▄ ░█░ █ █░▀░█ ██▄ █▄▀ █ █▀█
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- █▀ █▀▀ █▀█ █▀▀ █▀▀ █▄░█ █▀ █░█ █▀█ ▀█▀
-- ▄█ █▄▄ █▀▄ ██▄ ██▄ █░▀█ ▄█ █▀█ █▄█ ░█░
local outputfolder = "~/Pictures/Screenshots"
local filename = "\"$(date +'Screenshot_%Y-%m-%d-%H%M%S.png')\""
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -z -o " .. outputfolder .. " -f " .. filename .. " -m region"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -z -o " .. outputfolder .. " -f " .. filename .. " -m output"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("hyprshot -z -o " .. outputfolder .. " -f " .. filename .. " -m window"))

-- █▀▄▀█ █ █▀ █▀▀
-- █░▀░█ █ ▄█ █▄▄
hl.bind("SUPER + R", hl.dsp.exec_cmd("killall rofi || rofi -show drun -theme ~/.config/rofi/sidebar/sidebar.rasi"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -theme ~/.config/rofi/clipboard/clipboard.rasi -display-columns 2 | cliphist decode | wl-copy"))
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd("cliphist wipe"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + escape", hl.dsp.exec_cmd("wlogout --protocol layer-shell -P DP-1 -b 5 -T 550 -B 550"))
hl.bind("SUPER + F1", hl.dsp.exec_cmd("~/.config/hypr/keybind"))

-- █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▄▀█ █▀▀ █▄░█ ▀█▀
-- ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █░▀░█ █▀█ █░▀█ █▀█ █▄█ █░▀░█ ██▄ █░▀█ ░█░
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))
hl.bind("SUPER + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())

-- █▀▀ █▀█ █▀▀ █░█ █▀
-- █▀░ █▄█ █▄▄ █▄█ ▄█
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- █▀▄▀█ █▀█ █░█ █▀▀   █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█ 
-- █░▀░█ █▄█ ▀▄▀ ██▄   ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- █▀█ █▀▀ █▀ █ ▀█ █▀▀
-- █▀▄ ██▄ ▄█ █ █▄ ██▄
hl.bind("SUPER + CTRL + left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))

-- ▀█▀ ▄▀█ █▄▄ █▄▄ █▀▀ █▀▄
-- ░█░ █▀█ █▄█ █▄█ ██▄ █▄▀
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + tab", hl.dsp.group.next())

-- █▀ █▀█ █▀▀ █▀▀ █ ▄▀█ █░░
-- ▄█ █▀▀ ██▄ █▄▄ █ █▀█ █▄▄
hl.bind("SUPER + grave", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + grave", hl.dsp.window.move({ workspace = "special:magic" }))

-- █▀ █░█░█ █ ▀█▀ █▀▀ █░█
-- ▄█ ▀▄▀▄▀ █ ░█░ █▄▄ █▀█
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + ALT + up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + ALT + down", hl.dsp.focus({ workspace = "e-1" }))

-- █▀▄▀█ █▀█ █░█ █▀▀
-- █░▀░█ █▄█ ▀▄▀ ██▄
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- █▀▄▀█ █▀█ █░█ █▀ █▀▀   █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀
-- █░▀░█ █▄█ █▄█ ▄█ ██▄   █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
