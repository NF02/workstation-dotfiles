-- Concedi a OBS Studio il permesso esplicito per lo screencopy
hl.permission("obs", "screencopy", "allow")
hl.permission("com.obsproject.Studio", "screencopy", "allow")
hl.permission("com.obsproject.StudioCustom", "screencopy", "allow")

hl.permission("hyprshot", "screencopy", "allow")

-- Permessi di sistema necessari per il funzionamento di Hyprland
hl.permission("/usr/lib/hyprpolkitagent/hyprpolkitagent", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
