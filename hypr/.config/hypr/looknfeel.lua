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
  },

  master = {
    orientation = "center",
    mfact = 0.5,                       -- main window width fraction
    slave_count_for_center_master = 2, -- center the main window once 2+ sides exist
    new_status = "slave",              -- new windows join the sides; main stays main
    new_on_top = false,
  },
})

-- To flip a single workspace back to dwindle, add a rule such as:
-- hl.workspace_rule({ workspace = "9", layout = "dwindle" })
