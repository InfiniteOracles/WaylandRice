[# WaylandRice](https://github.com/InfiniteOracles/WaylandRice/tree/main - Dot files
**Terminal:**
- Oh-my-posh - https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/hul10.omp.json
- Fish - `yay -S fish`
- kitty (required for initial startup ) - `pacman -S kitty`
- Alacritty -`yay -S alacritty`
- Nerd font - `yay -S nerd-fonts`
**Hyprland + SilentSddm:**
- Hyprland - `sudo pacman -S hyprland`
- SilentSddm - `yay -S sddm-silent-theme && sudo pacman -S --needed sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
 Then put it in your Sddm config"
 `sudo nano /etc/sddm.conf`
  ```
[General]
InputMethod=qtvirtualkeyboard
GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard

[Theme]
Current=silent
```
Then activate sddm
```
sudo systemctl enable sddm
sudo systemctl start sddm
```

Hyprland config:
Change default terminal to alacritty add firefox keybind and change scale to 1.0 from auto on display config

)
