#http://sourabhbajaj.com/mac-setup/
#=========
#Alfred
#brew
#Amphetamine #keep awake
#The Unarchiver 
#pathfinder

#========Brew
#aircrack-ng
#homebrew/science/r
packages="
  coreutils
  curl
  emacs
  findutils
  gawk
  gcc
  gdal
  git
  gnu-getopt
  gnu-indent
  gnu-sed
  gnu-tar
  gnutls
  libsvg
  nmap
  p7zip
  perl
  python
  python3
  ruby
  sox
  unrar
  vim
  wget
  youtube-dl
  zsh
  zsh-completions
"
brew update
for package in $packages; do
	echo ------------------------------------------------------------------ $package
	brew install $package
done

#=============Brew Cask
packages="
  bitbar
  chromium
  firefox
  flux
  go2shell
  iterm2
  itsycal
  libreoffice
  monolingual
  spectacle
  transmission
  unetbootin
  virtualbox
  vlc
"

brew update
for package in $packages; do
	echo ------------------------------------------------------------------ $package
	brew cask install $package
done



#=============bitbar
mkdir -p ~/.bitbar
rm -f ~/.bitbar/worldclock.sh
cat > ~/.bitbar/worldclock.sh << EOF
#!/bin/bash
# Display UTC in the menubar, and one or more additional zones in the drop down.
# The current format (HH:MM:SS) works best with a one second refresh, or alter
# the format and refresh rate to taste.
ZONES="Australia/Sydney Europe/London America/New_York America/Los_Angeles"
date -u +'%H:%M UTC'
echo '---'
for zone in $ZONES; do
  echo "$(TZ=$zone date +'%H:%M %z') $zone"
done
EOF
chmod a+x ~/.bitbar/worldclock.sh




#=============sublime
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
