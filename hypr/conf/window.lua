-- ==============================================================================
-- LOGICA DELLE FINESTRE, WORKSPACE E REGOLE LAYOUT
-- ==============================================================================

----------------------------
---- DWINDLE (TILING) ------
----------------------------

hl.config({
    dwindle = {
        preserve_split = true, -- Mantiene la direzione dello split (orizzontale/verticale) quando sposti le finestre
    },
})

----------------------------
---- MASTER (TILING) -------
----------------------------

hl.config({
    master = {
        new_status = "master",
    },
})

----------------------------
---- SCROLLING (TILING) ----
----------------------------

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------------------
---- SMART GAPS / BORDERS --
----------------------------

-- Rimuove i gaps quando c'è una sola finestra sul workspace o in fullscreen nativo
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })

-- Forza l'azzeramento dei bordi e degli angoli per la singola finestra aperta
hl.window_rule({
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})

hl.window_rule({
    name  = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
})

----------------------------
---- REGOLE APPLICAZIONI ---
----------------------------

-- Blocca le richieste automatiche di massimizzazione delle app (evita che rompano il tiling)
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Risolve i problemi di trascinamento e focus con le applicazioni sotto XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

----------------------------
---- LAYER RULES (SwayNC) --
----------------------------

-- Gestione del layer del centro notifiche per evitare artefatti o ombre pesanti
hl.layer_rule({
    name  = "swaync-layer",
    match = { namespace = "^swaync-control-center$" },
    no_anim = false,
})

----------------------------
---- REGOLE AGGIUNTIVE -----
----------------------------

-- Hyprland-run: sposta e flotta il launcher
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- ==============================================================================
-- ESTETICA: PROFILO COLORI, CORNICI E DECORAZIONI
-- ==============================================================================

hl.config({
    general = {
        -- Spessore del bordo esterno delle finestre (in pixel)
        border_size = 2,

        -- Spaziature (Gaps) quando ci sono più finestre affiancate
        gaps_in  = 5,   -- Spazio tra due finestre adiacenti
        gaps_out = 10,  -- Spazio tra le finestre e il bordo dello schermo

        -- Configurazione dei Colori dei Bordi
        col = {
            -- Gradiente a 45 gradi da Azzurro Neon a Verde Acqua (Attivo)
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            -- Grigio Scuro Opaco (Inattivo)
            inactive_border = "rgba(595959aa)",
        },

        -- Rende possibile il ridimensionamento trascinando i bordi vuoti con il mouse
        resize_on_border = true,
        
        -- Configurazione del layout predefinito (Tiling dinamico)
        layout = "dwindle",
    },

    decoration = {
        -- Arrotondamento degli angoli delle finestre (10px, coerente con Waybar e SwayNC)
        rounding       = 10,
        rounding_power = 2,

        -- Trasparenze (1.0 = opacità totale per la massima leggibilità del testo)
        active_opacity   = 1.0,
        inactive_opacity = 0.9, -- Leggera trasparenza per le finestre in background

        -- Gestione dell'effetto Sfocatura (Blur) dietro le finestre trasparenti
        blur = {
            enabled   = true,
            size      = 4,
            passes    = 2,        -- Più passaggi aumentano la qualità del blur a scapito della GPU
            vibrancy  = 0.1696,
            new_optimizations = true,
        },

        -- Configurazione delle Ombreggiature delle finestre
        shadow = {
            enabled      = true,
            range        = 12,            -- Ampiezza dell'ombra
            render_power = 3,             -- Intensità del gradiente dell'ombra
            color        = 0x66000000,    -- Nero morbido trasparente
        },
    },
})
