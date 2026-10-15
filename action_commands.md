# Prism action commands

Every Prism panel and action can be triggered from a terminal, a script or a Hyprland keybind.
`install.sh` already binds the common ones (see `hypr/prism-binds.lua`). To add or change binds, put
lines like this in your Hyprland config:

```lua
hl.bind("SUPER + N", hl.dsp.exec_cmd("prism sidebar toggle"))
```

If a key already runs something else (an old launcher or notification daemon), replace that line
rather than adding a second bind for the same key, or both commands will run.

## Panels

| What | Command |
|---|---|
| Launcher | `prism launcher toggle` |
| Notification center (right drawer) | `prism sidebar toggle` |
| Controls (left drawer) | `prism controls toggle` |
| Dashboard | `prism dashboard toggle` |
| Clipboard | `prism clipboard toggle` |
| Emoji | `prism emoji toggle` |
| Workspace overview | `prism overview toggle` |
| Wallpaper picker | `prism wallpaper toggle` |
| Random wallpaper | `prism wallpaper random` |
| Power menu | `prism power toggle` |
| Screenshot menu | `prism screenshot menu` |
| Screen recording menu | `prism record menu` |
| Quick edit (open favourite folders in your editor) | `prism edit toggle` |
| Keybind cheatsheet | `prism cheatsheet toggle` |
| Window switcher (live previews, alt-tab style) | `prism switcher toggle` |
| Floating clock (timer, stopwatch, alarms, focus) | `prism clock toggle` (or `clock tab timer`, `clock tab alarms`, …) |

## Direct actions

| What | Command |
|---|---|
| Screenshot region | `prism screenshot region` |
| Screenshot window | `prism screenshot window` |
| Screenshot screen | `prism screenshot full` |
| Start/stop screen recording | `prism record toggle` |
| Record region / window / screen | `prism record region`, `window` or `full` |
| Stop recording | `prism record stop` |
| Volume up | `prism osd volumeUp` |
| Volume down | `prism osd volumeDown` |
| Mute | `prism osd mute` |
| Mic mute | `prism osd micMute` |
| Brightness up | `prism osd brightnessUp` |
| Brightness down | `prism osd brightnessDown` |
| Play / pause | `prism media playPause` |
| Next track | `prism media next` |
| Previous track | `prism media previous` |
| Start a timer | `prism clock timer 25` (minutes; `0` cancels it) |
| Stopwatch start/pause | `prism clock stopwatch` |
| Stop / snooze a ringing alarm or timer | `prism clock stop` / `prism clock snooze` |
| Focus timer start/stop (Pomodoro) | `prism focus toggle` |
| Focus pause/resume | `prism focus pause` |
| Skip to next focus/break phase | `prism focus skip` |
| Light / dark theme toggle | `prism theme toggle` (or `theme light` / `theme dark`) |
| Do not disturb | `prism toggle dnd` |
| Caffeine (stay awake) | `prism toggle caffeine` |
| Study noise | `prism toggle noise` |
| EasyEffects on / off (off = killed) | `prism toggle easyeffects` |
| Game mode | `prism toggle gamemode` |
| Power profile | `prism toggle profile` |
| Clear notifications | `prism notify clear` |
| Lock screen | `prism lock lock` |
| Preview the Prism lock screen (doesn't lock) | `prism lock preview` |

`lock lock` uses Prism's lock screen when "Prism lock screen" is on in Dashboard → Settings, and
hyprlock otherwise. Try Prism's with `lock preview` first.

The volume and brightness popup in the island also appears when the volume or brightness changes
some other way (for example `wpctl` or `brightnessctl` on the media keys).

## Getting notifications into Prism

Prism is the notification daemon unless another one (swaync, mako, dunst) is already running.
Remove that one from your autostart, run `pkill swaync` (or mako / dunst) once, and Prism takes
over.
