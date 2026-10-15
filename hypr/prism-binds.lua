-- Prism keybinds — every action from action_commands.md on a key.
-- install.sh loads this at the end of hyprland.lua, after your own binds. Each key
-- here is unbound first, so it replaces whatever that key did before instead of
-- running both. Edit freely; SUPER + / shows every bind (this file included).

local mainMod = "SUPER"

-- bind a key, replacing any earlier bind on it
local function bind(keys, action, opts)
    pcall(hl.unbind, keys)
    hl.bind(keys, action, opts)
end

-- volume / brightness / media go through Prism (shows the OSD); if the shell
-- isn't running they fall back to the plain tools so the keys always work
local function osd(ipc, fallback)
    return hl.dsp.exec_cmd("prism " .. ipc .. " || " .. fallback)
end

---- PANELS ----
bind(mainMod .. " + S",                hl.dsp.exec_cmd("prism launcher toggle"))
bind(mainMod .. " + escape",           hl.dsp.exec_cmd("prism dashboard toggle"))
bind(mainMod .. " + SHIFT + escape",   hl.dsp.exec_cmd("prism controls toggle"))
bind(mainMod .. " + N",                hl.dsp.exec_cmd("prism sidebar toggle"))
bind(mainMod .. " + O",                hl.dsp.exec_cmd("prism overview toggle"))
bind(mainMod .. " + SHIFT + TAB",      hl.dsp.exec_cmd("prism switcher toggle"))
bind(mainMod .. " + M",                hl.dsp.exec_cmd("prism power toggle"))
bind(mainMod .. " + slash",            hl.dsp.exec_cmd("prism cheatsheet toggle"))
bind(mainMod .. " + SHIFT + Q",        hl.dsp.exec_cmd("prism edit toggle"))

---- PICKERS ----
bind(mainMod .. " + V",                hl.dsp.exec_cmd("prism clipboard toggle"))
bind(mainMod .. " + period",           hl.dsp.exec_cmd("prism emoji toggle"))
bind(mainMod .. " + W",                hl.dsp.exec_cmd("prism wallpaper toggle"))
bind(mainMod .. " + SHIFT + W",        hl.dsp.exec_cmd("prism wallpaper random"))

---- CAPTURE ----
bind("Print",                          hl.dsp.exec_cmd("prism screenshot menu"))
bind(mainMod .. " + ALT + P",          hl.dsp.exec_cmd("prism screenshot menu"))
bind("SHIFT + Print",                  hl.dsp.exec_cmd("prism screenshot region"))
bind("CTRL + Print",                   hl.dsp.exec_cmd("prism screenshot full"))
bind("ALT + Print",                    hl.dsp.exec_cmd("prism screenshot window"))
bind(mainMod .. " + ALT + R",          hl.dsp.exec_cmd("prism record menu"))
bind(mainMod .. " + SHIFT + ALT + R",  hl.dsp.exec_cmd("prism record stop"))

---- TOGGLES ----
bind(mainMod .. " + ALT + T",          hl.dsp.exec_cmd("prism theme toggle"))
bind(mainMod .. " + ALT + F",          hl.dsp.exec_cmd("prism focus toggle"))
bind(mainMod .. " + ALT + K",          hl.dsp.exec_cmd("prism clock toggle"))
bind(mainMod .. " + ALT + N",          hl.dsp.exec_cmd("prism toggle dnd"))
bind(mainMod .. " + CTRL + N",         hl.dsp.exec_cmd("prism notify clear"))
bind(mainMod .. " + ALT + C",          hl.dsp.exec_cmd("prism toggle caffeine"))
bind(mainMod .. " + ALT + G",          hl.dsp.exec_cmd("prism toggle gamemode"))
bind(mainMod .. " + ALT + E",          hl.dsp.exec_cmd("prism toggle easyeffects"))

---- MINIMIZE ----
bind(mainMod .. " + ALT + Space",      hl.dsp.window.move({ workspace = "special:minimize", follow = false }))
bind(mainMod .. " + SHIFT + Space",    hl.dsp.workspace.toggle_special("minimize"))

---- SESSION ----
bind(mainMod .. " + L",                hl.dsp.exec_cmd("prism lock lock"))

---- MEDIA KEYS ----
bind("XF86AudioRaiseVolume",  osd("osd volumeUp", "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
bind("XF86AudioLowerVolume",  osd("osd volumeDown", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
bind("XF86AudioMute",         osd("osd mute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),          { locked = true })
bind("XF86AudioMicMute",      osd("osd micMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true })
bind("XF86MonBrightnessUp",   osd("osd brightnessUp", "brightnessctl set 5%+"),                       { locked = true, repeating = true })
bind("XF86MonBrightnessDown", osd("osd brightnessDown", "brightnessctl set 5%-"),                     { locked = true, repeating = true })
bind("XF86AudioPlay",         osd("media playPause", "playerctl play-pause"),                         { locked = true })
bind("XF86AudioPause",        osd("media playPause", "playerctl play-pause"),                         { locked = true })
bind("XF86AudioNext",         osd("media next", "playerctl next"),                                    { locked = true })
bind("XF86AudioPrev",         osd("media previous", "playerctl previous"),                            { locked = true })
