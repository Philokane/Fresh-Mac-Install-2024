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

# Always show scrollbars
#defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false


# Install Google Cloud SDK and Components
echo "Install Google Cloud SDK and Components"
    echo "Google Cloud SDK"        "brew install --cask google-cloud-sdk"
    # echo
    #     echo "✔ Prepping Autocompletes and Paths"
    #     source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
    #     source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
    # echo
        if [ -e ~/google-cloud-sdk ]; then
            echo "✔ ~/google-cloud-sdk exists. Skipping"
        else
            echo "✔ Creating ~/google-cloud-sdk symlink"
            ln -s "$(brew --prefix)/Caskroom/google-cloud-sdk" ~/google-cloud-sdk &>/dev/null
            # make a convenience symlink at the install path for google-cloud-sdk when installed manually
        fi
    echo "App Engine - Go"             "gcloud components install app-engine-go --quiet"
    echo "App Engine - Python"         "gcloud components install app-engine-python --quiet"
    echo "App Engine - Python Extras"  "gcloud components install app-engine-python-extras --quiet"
    echo "Kubectl"                     "gcloud components install kubectl --quiet"
    echo "Docker Credentials"          "gcloud components install docker-credential-gcr --quiet"
echo

# Install xcode cli development tools
echo "Installing xcode cli development tools"
echo
    xcode-select --install && \
        read -n 1 -r -s -p $'\n\nWhen Xcode cli tools are installed, press ANY KEY to continue...\n\n' || \
            echo && echo "✔ Xcode cli tools already installed. Skipping"
echo


# Install Brew
echo "Installing Homebrew"
echo
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo
    echo "✔ Setting Path for Homebrew"
    echo "Setting path"

    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile
    
    echo "Path After:"
    echo $PATH
echo
    echo "✔ (zsh) Fix brew insecure directories warning"
    chmod go-w "$(brew --prefix)/share"
echo

# Save screenshots to the Pictures/Screenshots
mkdir ${HOME}/Pictures/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "Installing brew cask..."
brew tap homebrew/cask

# Install oh-my-zsh using curl
echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install oh-my-zsh using wget
#sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"