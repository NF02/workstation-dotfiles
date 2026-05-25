-- ==============================================================================
-- PROGRAMMI DI RIFERIMENTO
-- ==============================================================================

local terminal    = "ghostty"
local fileManager = "pcmanfm-qt"
local menu        = "hyprlauncher"
local emacs       = "emacsclient -c"

-- ==============================================================================
-- KEYBINDING IN STILE DWM
-- ==============================================================================

local mainMod = "SUPER"

----------------------------
---- AVVIO APPLICAZIONI ----
----------------------------
-- Return = terminal, D = launcher (dmenu)

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd(emacs))

----------------------------
---- GESTIONE FINESTRE -----
----------------------------
-- Q = kill, F = fullscreen, Shift+Space = float, Shift+Return = zoom

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

----------------------------
---- LAYOUT ----------------
----------------------------
-- T = tiled (togglesplit), M = monocle (fullscreen), Space = cycle layout

hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Space", hl.dsp.layout("togglesplit"))

----------------------------
---- SPAZIO DI LAVORO -----
----------------------------
-- 1-9 = workspace, Tab = previous workspace, S = special (scratchpad)

for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0",           hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0",   hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

----------------------------
---- MOVIMENTO FOCUS -------
----------------------------
-- J/K = giù/sù, H/L = sinistra/destra

hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

----------------------------
---- MONITOR ---------------
----------------------------
-- ,/. = prev/next monitor

hl.bind(mainMod .. " + comma",          hl.dsp.exec_cmd("hyprctl dispatch focusmonitor -1"))
hl.bind(mainMod .. " + period",         hl.dsp.exec_cmd("hyprctl dispatch focusmonitor +1"))
hl.bind(mainMod .. " + SHIFT + comma",  hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor -1"))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor +1"))

----------------------------
---- TRASCINAMENTO MOUSE ---
----------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------------------
---- SISTEMA --------------
----------------------------
-- B = bar, Escape = lock, R = reload, Shift+Q = shutdown, N = notifiche

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("darkman toggle"))

----------------------------
---- MULTIMEDIA ------------
----------------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),  { locked = true, repeating = true })
