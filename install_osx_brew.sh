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
  avconv
  coreutils
  curl
  emacs
  findutils
  gawk
  gcc
  git
  gnu-getopt
  gnu-indent
  gnu-sed
  gnu-tar
  gnutls
  libsvg
  midnight-commander
  netcat
  nmap
  p7zip
  perl
  python
  python3
  ruby
  sc-im
  sox
  tig
  unrar
  vim
  wget
  youtube-dl
  zsh
  zsh-completions
  zsh-syntax-highlighting 
  zsh-autosuggestions
"
brew update
for package in $packages; do
	echo ------------------------------------------------------------------ $package
	brew install $package
done

dev_packages="
  jq
  tree
  tldr
"
for package in $dev_packages; do
	echo ------------------------------------------------------------------ $package
	brew install $package
done

#=============Brew Cask
packages="
  adobe-acrobat-reader
  # Amphetamine # don't sleep when lid is closed
  bitbar
  brave-browser
  chromium
  commander-one
  firefox
  flux
  go2shell
  grandperspective
  iina
  iterm2
  itsycal  # date pattern YYYY.MM.dd E hh:mm:ss
  keepingyouawake
  libreoffice
  macs-fan-control  # sensor=CPU PECI 40-70
  monolingual
  monitorcontrol  # control external monitor
  pycharm-ce
  shottr  # screenshot
  signal
  slack
  spectacle
  sublime-text
  telegram-desktop
  transmission
  unetbootin
  virtualbox
  vivaldi
  vlc
  xnviewmp
"

#Subler  # annotate video subtitles

brew update
for package in $packages; do
	echo ------------------------------------------------------------------ $package
	brew install --cask $package
done

cask_dev_packages="
  dash
  postman
  docker
  docker-compose
  sourcetrail
"
for package in $cask_dev_packages; do
	echo ------------------------------------------------------------------ $package
	brew install --cask $package
done



#=============bitbar
mkdir -p ~/.bitbar
cp -f bitbar.worldclock.sh ~/.bitbar
chmod a+x ~/.bitbar/bitbar.worldclock.sh


#=============sublime
mkdir -p  "~/Library/Application Support/com.colliderli.iina/input_conf"
cp iina_custom.conf "~/Library/Application Support/com.colliderli.iina/input_conf"


#=============sublime
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl


#=============osx related
# sudo ln -sf /usr/share/zoneinfo/UTC /etc/localtime
defaults write -g ApplePressAndHoldEnabled -bool false
