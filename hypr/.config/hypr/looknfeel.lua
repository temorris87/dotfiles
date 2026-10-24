-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
-- hl.config({
--   general = {
--     -- No gaps between windows or borders.
--     gaps_in = 0,
--     gaps_out = 0,
--     border_size = 0,
--
--     -- Change to niri-like side-scrolling layout.
--     layout = "scrolling",
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--
--     -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
--     dim_inactive = true,
--     dim_strength = 0.15,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

-- ── Centered master layout ───────────────────────────────────────────────
-- Main window centered, supporting windows split onto the left and right.
-- Resizing the main window (SUPER + -/=, or SUPER + right-drag) grows mfact
-- and takes space symmetrically from both side columns.
-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
  general = {
    layout = "master",

    gaps_in = 6,
    gaps_out = 12,
    border_size = 2,

    -- Window border colours come from the active theme's hyprland.lua.
  },

  master = {
    orientation = "center",
    mfact = 0.5,                       -- main window width fraction
    slave_count_for_center_master = 2, -- center the main window once 2+ sides exist
    new_status = "slave",              -- new windows join the sides; main stays main
    new_on_top = false,
  },

  layout = {
    -- Constrain a lone window to 16:9 and keep it centered (orientation = center).
    single_window_aspect_ratio = { 16, 9 },
  },

  decoration = {
    rounding = 10,

    dim_inactive = true,
    dim_strength = 0.08,

    blur = {
      enabled = true,
      size = 6,
      passes = 3,
      new_optimizations = true,
      ignore_opacity = true,
      xray = false,
      noise = 0.012,
      contrast = 1.0,
      brightness = 0.9,
      vibrancy = 0.18,
    },

    shadow = {
      enabled = true,
      range = 24,
      render_power = 3,
      color = "rgba(1a1a1aee)",
      offset = "0 6",
    },
  },
})

-- Mostly opaque so the bright wallpaper doesn't wash windows out; a hint of
-- translucency keeps the blur behind them readable.
o.window({ tag = "default-opacity" }, { opacity = "0.97 0.92" })

-- ── Snappier animations ──────────────────────────────────────────────────
-- Omarchy's defaults are a touch slow; speed up the window + border curves.
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "border", enabled = true, speed = 8, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 4, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 4, bezier = "almostLinear" })
hl.animation({ leaf = "layers", enabled = true, speed = 5, bezier = "easeOutQuint" })

-- To flip a single workspace back to dwindle, add a rule such as:
-- hl.workspace_rule({ workspace = "9", layout = "dwindle" })
