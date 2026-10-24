-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

-- Pin every numbered workspace to the LG ultrawide (DP-3).
-- Without this, Hyprland ties each workspace to whichever monitor it was first
-- opened on. When an empty workspace ends up parked on the laptop panel (eDP-1),
-- pressing SUPER+<n> from the ultrawide silently moves focus to the laptop
-- instead of showing that empty workspace where you're looking.
-- If DP-3 is unplugged, Hyprland relocates these to whatever monitor remains.
for n = 1, 10 do
  hl.workspace_rule({ workspace = tostring(n), monitor = "DP-3" })
end
