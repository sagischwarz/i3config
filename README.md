# i3 Configuration
Files for my i3 window manager configuration.

## Install packages
    sudo apt install i3 dunst pasystray paman pavucontrol pavumeter paprefs ranger nitrogen compton

## Clone
    https://github.com/jefuba/i3config
Set soft links to appropriate locations.

## Lock screen on sleep with systemd
Add to /etc/systemd/system/wakelock.service
    [Unit]
    Description=Lock the screen on resume from suspend
    Before=sleep.target
    
    [Service]
    User=jens
    Type=forking
    Environment=DISPLAY=:0
    ExecStart=/home/jens/.local/bin/lockscreen.sh
    
    [Install]
    WantedBy=sleep.target
Run
    systemctl enable wakelock.service

## Power events with systemd
Edit /etc/systemd/logind.conf
    HandlePowerKey=suspend
    HandleLidSwitch=ignore
    HandleLidSwitchDocked=ignore

## Set a file manager as default for directories (e.g., Thunar)
    xdg-mime default Thunar.desktop inode/directory

## Fix mouse cursor size
    xsetroot -cursor_name left_ptr

## Configure Compton to avoid screen tearing
Add to ~/.config/compton.conf
    backend = "glx";
    glx-no-stencil = true;
    paint-on-overlay = true;
    vsync = "opengl-swc";
