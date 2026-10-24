-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = "auto"

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Explicit per-monitor config. The LG ultrawide supports 75Hz but "preferred"
-- picks its 60Hz mode, so pin it.
hl.monitor({ output = "DP-3", mode = "3840x1600@75", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "3840x2160@60", position = "3840x0", scale = 2 })

-- Fallback for any other display that gets plugged in.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
