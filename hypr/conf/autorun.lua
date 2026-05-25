-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Forziamo Wayland pulito per QT e GTK
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GLFW_IMPL", "wayland")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- ==============================================================================
-- AUTOSTART / PROCESSOR RUN ON LAUNCH
-- ==============================================================================

hl.on("hyprland.start", function ()
         -- 1. Esporta l'ambiente grafico a systemd e dbus (Cruciale per sbloccare l'App ID)
         hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland &")
         hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &")
         
         -- 2. Killa i portali orfani rimasti appesi con i vecchi ID registrati
         hl.exec_cmd("systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk 2>/dev/null")
         
         -- 3. Fai ripartire i portali in modo pulito
         hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland &")
         hl.exec_cmd("systemctl --user start xdg-desktop-portal-gtk &")
         
         -- Demone delle notifiche (SwayNC)
         hl.exec_cmd("swaync &")
    
         -- Barra di stato e Widget avanzati (AGS)
         hl.exec_cmd("waybar &")

end)
