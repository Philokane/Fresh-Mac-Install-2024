#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

# OSX System Tweaks - some may require restart

echo "System Tweaks"
    echo
    echo "✔ General: Expand save and print panel by default"
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
        defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
        defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
    echo "✔ General: Save to disk (not to iCloud) by default"
        defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
    echo "✔ General: Avoid creating .DS_Store files on network volumes"
        defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    echo
    # Enable character repeat on keydown
    defaults write -g ApplePressAndHoldEnabled -bool false
    # Set a shorter Delay until key repeat
    #defaults write NSGlobalDomain InitialKeyRepeat -int 12
    # fast keyboard repeat rate
    #defaults write NSGlobalDomain KeyRepeat -int 0
    # Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "
    # Disable window animations ("new window" scale effect)
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
    # Disable window animations ("new window" scale effect)
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
    # Set default Finder location to home folder (~/)
    defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
    defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
    # Check for software updates daily, not just once per week
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1    
    
    echo "✔ Typing: Disable smart quotes and dashes as they cause problems when typing code"
        defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
        defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
    echo "✔ Typing: Disable press-and-hold for keys in favor of key repeat"
        defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
    echo
    # Use current directory as default search scope in Finder
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    
    # Don't show icons for hard drives, servers, and removable media on the desktop
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false && \
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false && \
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool false && \
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

    echo "✔ Finder: Show status bar and path bar"
        defaults write com.apple.finder ShowStatusBar -bool true
        defaults write com.apple.finder ShowPathbar -bool true
    echo "✔ Finder: Disable the warning when changing a file extension"
        defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    echo "✔ Finder: Show the ~/Library folder"
        chflags nohidden ~/Library
    echo

        echo "✔ Safari: Enable Safari’s Developer Settings"
        defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
        defaults write com.apple.Safari IncludeDevelopMenu -bool true
        defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
        defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
        defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
    echo

       echo "✔ Safari: Enable Safari’s Developer Settings"
        defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
        defaults write com.apple.Safari IncludeDevelopMenu -bool true
        defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
        defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
        defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
    echo
    
    # Note: The chrome defaults can cause your Chrome browser to display a message stating
    # that Chrome is "Managed by your organization" when it isn't
    # 
    # To view policies that are affecting this message, view the following pages:
    # chrome://policy and chrome://management/
    # 
    # To quickly remove Chrome default overrides, run the following commands:
    # defaults delete com.google.Chrome
    # defaults delete com.google.Chrome.canary
    #
    echo "✔ Chrome: Disable the all too sensitive backswipe on Trackpads and Magic Mice"
        defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
        defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
        defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
        defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false
    echo "✔ Chrome: Use the system print dialog and expand dialog by default"
        defaults write com.google.Chrome DisablePrintPreview -bool true
        defaults write com.google.Chrome.canary DisablePrintPreview -bool true
        defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
        defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
echo
# Menu bar: hide the Time Machine, Volume, and User icons
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
        "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
        "/System/Library/CoreServices/Menu Extras/Volume.menu" \
        "/System/Library/CoreServices/Menu Extras/User.menu"
done




# Install  Apps
echo "Installing Apps"

echo "System apps..."
brew install bash-completion 
brew install zsh-completions
brew install tree 
brew install --cask rectangle
brew install wget
brew install findutils
brew install --cask numi
brew install --cask tunnelblick
brew install go
brew install tmux
brew install tree
brew install htop
brew cask install alfred
brew install --cask notion
brew install --cask iterm2
brew install tldr # man pages https://tldr.sh/
brew install dash
brew install --cask the-unarchiver
brew install --cask android-file-transfer
brew install --cask notion
brew install transmit
brew install --cask daisydisk
brew install --cask http-toolkit
brew install --cask imageoptim
brew install --cask raspberry-pi-imager
brew install --cask tradingview
brew install --cask todoist
brew install --cask 

# Dev Tools
echo "Installing web/dev tools..."
brew install --cask visual-studio-code
echo "Installing development tools..."
brew install docker
brew install git
brew install wget
brew install hashicorp/tap/terraform
brew install speedtest-cli
brew install awscli
brew install httpie
brew install node
brew install nvm
brew install --cask hammerspoon
brew install wireshark
brew install --cask yubico-yubikey-manager
brew install jupyter

# Communication Apps
echo "Installing communication apps..."
brew install --cask discord
brew install --cask microsoft-teams
brew install --cask slack
brew install --cask zoom
brew install --cask whatsapp
brew install --cask telegram
brew install --cask signal

# Browsers
echo "Install browsers..."
brew install --cask google-chrome
brew install --cask firefox
brew cask install homebrew/cask-versions/firefox-developer-edition
brew install --cask brave-browser

# set Chrome as default browser
open -a "Google Chrome" --args --make-default-browser

# File Storage
echo "Installing cloud file storage tools..."
brew install --cask dropbox
brew install --cask onedrive
brew install --cask google-drive
brew install --cask box-drive

# Writing Apps
echo "Installing writing apps..."
brew install pandoc
brew install --cask zotero
#brew install --cask microsoft-word
brew install --cask mark-text
brew install mackup
brew install --cask obsidian
brew install --cask typora
brew install --cask sublime-text
brew cask install macdown
brew cask install marked
brew cask install calibre
brew install microsoft-office


# Other
echo "Installing everything else..."
brew install 1password
brew install --cask anki




# Media
brew install vlc
brew install ffmpeg
brew install --cask iina
brew install --cask spotify
brew install yt-dlp

# Web/http tools
brew install --cask postman
brew install mvn
brew install jq
brew install nmap
brew install mtr
brew install sslscan
brew install httpstat
brew install openssl

### change macOS python to python3 from `/usr/bin/python`
ln -s /usr/local/bin/python3 /usr/local/bin/python


### Update .zshrc

wget https://gist.githubusercontent.com/saetia/2764210/raw/ab099b587689640eb32cbc1afdb6a19b62be7fb0/.zshrc -O \
~/.zshrc

#syntax highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git \
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


### Agree To Xcode
sudo xcrun cc

#copy ssh key to clipboard for adding to github.com
pbcopy < ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

# set git config values

ssh-keygen -t rsa -C "xxxx@mail.com"
git config --global user.name "philokane" && \
git config --global user.email "phil@icedcoffee.ie" && \
git config --global color.ui true && \
git config --global push.default simple

cho ""
ssh-keygen -t rsa -b 4096 -C "phil@icedcoffee.ie"
echo "Copy/paste the following public key into GitHub -> https://github.com/settings/ssh/new"
echo ""
cat ~/.ssh/id_rsa.pub
echo ""

echo "Also, while there, create a new personal access token -> https://github.com/settings/tokens"
echo ""
#token
#git config --global github.token your_token_here




# Reset brew
brew update
brew upgrade brew-cask
brew cleanup
brew cask cleanup
brew tap caskroom/fonts

# System Preferences
# Dock
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
defaults write com.apple.dock largesize -int 30
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock magnification -bool false 
defaults write com.apple.dock autohide -bool true
killall Dock

defaults write com.apple.finder FXPreferredViewStyle Clmv
killall Finder



echo "Complete. Some apps may require restart/logout."