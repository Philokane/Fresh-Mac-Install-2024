# Fresh Mac OSX Install 2024

This document describes the actions I take when configuring a new Mac OSX Installation. This Macbook Pro is a multi-functional devices for media and dev.

First change is to enable touch to click and drag lock in the Accessibility settings >> Trackpad Options >> `Use trackpad for dragging` `With Drag Lock`. Next change `Caps Lock` to `Escape` as a custom action by going to Settings >> Keyboard >> Keyboard Shortcuts >> Modifier Keys.

First install Homebrew in order to efficiently install other apps.

![Fresh Mac Install 2024](/images/fresh-macbookinstall2024.jpg)

- Install [apps](/appsinstall2024.sh)
- Run [preferences update](/macprefs2024.sh)
- [Follow guide](/Fresh%20Mac%20Install%202024) for updating manual preferences and activating apps
`

Next install Homebrew.
This app allows for command line installation of Mac applications.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Git

```
brew install git
```
---
Install ZSH & oh-my-zsh
- https://github.com/ohmyzsh/ohmyzsh
- https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
- https://blog.larsbehrenberg.com/how-to-install-custom-plugins-and-themes-with-oh-my-zsh#where-to-find-your-plugins-and-themes
- https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins


Begin by installing `zsh`

```
brew install zsh
```

```
brew install zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Clone oh-my-zsh
```
git clone http://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
```

<!-- ```
curl -O https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors
``` -->

Install zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

**zsh plugins**
```
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  zsh-autosuggestions
  last-working-dir
  web-search
  cloudfoundry
  history
)
```
---

### Installation 
Clone the repo.
```
git clone https://github.com/Philokane/Fresh-Mac-Install-2024.git
```

Make file executable: 
```
chmod u+x appsinstall2024.sh macprefs2024.sh
```
Run `appsinstall2024.sh` shell script.
```
./appsinstall2024.sh
```

Run `macprefs2024.sh` shell script
```
./macprefs2024.sh
```
---

## Manual Preferences Configurations

**Pointer Control**
Double-click speed `80%`
Spring-loading `Off`

**Trackpad Options...**
Use trackpad for dragging `On`
Dragging style `With Drag Lock`

### System Preferences

### Finder Preferences

<img src="images/2024-04-27 at 17.06.00@2x.png" width="500">
<img src="images/2024-04-27 at 17.04.43@2x.png" width="500">
<img src="images/2024-04-27 at 17.06.27@2x.png" width="500">
<img src="images/2024-04-27 at 17.07.26@2x.png" width="500">


- General > Uncheck all.
- New Finder windows show $Home
- Open folders in tabs

**Tags**

- Uncheck all

**Sidebar**

Uncheck all but:

- Applications
- Desktop
- Documents
- Downloads
- Pictures
- $Home
- iCloud Drive
- Shared
- External Disks
- Bonjour Computers

**Advanced**

Uncheck all but

- Show warning before removing from iCloud Drive
- Show warning before emptying the Bin
- Keep folders on top:
- In windows when sorting by name

 When performing a search:
 'Search the current folder'

### Desktop Preferences (Right-click on Desktop)

Stack by `None`
Sort by `Snap to Grid`
Icon size `44 x 44`
Grid spacing `Max`
Text size `12`
Label position `Right`
`x` Show item info
`✔️` Show icon preview

## System Settings

### Network

- Enable firewall.
- Enable stealth mode

### Notifications

### Sound

- Alert Sound - Boop
- Play sound on startup x
- Play user interface sound effects x
- Play feedback when volume is changed

### Appearance

- Appearance: `Dark`
- Colour: `Accent Colour`
- Show scroll bars - `Always`
- Click in the scroll bar to - `Jump to the spot that's clicked`

<img src="images/CleanShot%202024-04-11%20at%2012.02.39@2x.png" width="500">

### Accessibility

**Pointer Control**
Double-click speed `80%`
Spring-loading `Off`

**Trackpad Options...**
Use trackpad for dragging `On`
Dragging style `With Drag Lock`

**Zoom**
- Use keyboard shortcuts to zoom ✔️
- Use trackpad gesture to zoom ✔️
- Use scroll gestiure with modifier keys to zoom ✔️
- Modifier key `^ Control`
- Zoom style - Full Screen

<img src="images/CleanShot%202024-04-11%20at%2012.24.36@2x.png" width="500">
**Keyboard**

- Key repeat rate - `Fast`
- Delay until repeat - `short`
- Adjust keyboard brightness in low light `off`
- Keyboard brightness `max`
- Turn keyboard backlight off after inactivity - `Never`
- Press fn key to `Do Nothing`

### Keyboard shortcuts
<img src="/images/2024-04-12 at 12.36.23@2x.png" width="500">

**Launchpad & Doc**
- Uncheck both

**Display**
- Uncheck both

**Mission Control**

- Uncheck all except `Mission Control` `Application windows` `Mission Control > Move Left a space | > Move right a space`
- `✔️ Show Notification Centre` Set shortcut: `⌘⌥k` 

**Keyboard** - leave all checked (this may be updated in the future)

**Screenshots** - Uncheck all in favour of `CleanShot X`

**Services** - Ignore all (May be updated in future)

**Spotlight** Uncheck both

**Uncheck all except** `Zoom`

**Function Keys** `Disabled`

**Modifier Keys** `Caps Lock >> Escape`

**Dictation** - Off

**Microphone Source** Macbook

**Siri** - Off

### Trackpad

**Point & Click**
Tracking Speed - Fastest
Click - Medium
Force Click & haptic feedback `✔️`
Look up & data detectors `Off`
Secondary click `Click or Tap w/ Two Fingers`
Tap to click `✔️`

**Scroll & Zoom**
(Defaults)
Natural Scrolling `✔️`
Zoom in or out `✔️`
Smart zoom `✔️`
Rotate `✔️`

**More Gestures**
Swipe between pages `Off`
Notification Centre `Off`
Mission Control `Swipe Up w/ Three Fingers`
App Exposé `Swipe Down w/ Three Fingers`
Launchpad `Off`
Show Desktop `On`

### Control Centre

Nothing set atm

### Siri & Spotlight

**Siri** `Off`

### Desktop & Dock

Dock Size `10%`
Magnification `10%`
Position `Left`
Minimise windows using `Scale Effect`
Double-click a window's title bar to `Do Nothing`
Minimuse windows into application icon `Off`
Automatically hide and show Dock `On`
Animate opening applications `Off`

**Desktop & Stage Manager**
Show Items >> `x` `x`
Click Wallpaper to reveal desktop `Only on Stage Manager`

Stage Manager `x`
Show Widgets `x` `x`
Use iPhone widgets `x`
Default web browser `x`

**Hot Corners**
Top Right `Application Windows`
Top Left `Mission Control`
Bottom Right `Desktop`
Bottom Left `-`

### Screensaver

**Lock Screen Settings**
Start Screen Saver when inactive `10 mins`
Turn discplay off on battery when inactive `2 mins`
Turn display off on power adapter `30mins`
Require password after `1 min`
Show username and photo `x`
Show password hints `x`

### Touch ID

Use Touch ID - Enable fingerprint
