install_apt () {
  packages="
  build-essential
  zsh vim screen tmux
  git tig mc
  curl wget nmap netcat
  scim
  ssh
  youtube-dl
  "
  junk_packages="
  coreutils findutils
  rar unrar p7zip p7zip-full
  youtube-dl
  geeqie 
  gnome-tweak-tool
  tlp tlp-rdw
  ulauncher
  caffeine
  "
  thinkpad_packages="
  tp-smapi-dkms acpi-call-dkms
  "

  dev_packages="
  gcc libpq-dev 
  python-dev  
  python3-dev python3-pip python3-venv python3-wheel 
  firefox-geckodriver
  "
  gui_packages="
  brave
  vlc
  pycharm-community
  slack
  sublime-text
  docker
  dc-manager
  postman
  robo3t-snap
  "

  sudo apt-get install -y $packages
  sudo apt-get install -y $junk_packages
  sudo apt-get install -y $dev_packages
  sudo apt-get install -y $thinkpad_packages
  for package in $gui_packages; do
    echo ------------------------------------------------------------------ $package
    sudo snap install --classic $package
  done
  pip3 install wheel
}

install_keyboard () {
  keyboard_file=/etc/default/keyboard
  if [ -f $keyboard_file ]; then
    if grep swapescape $keyboard_file > /dev/null; then
      # echo "capslock is already swapped"
      true
    else
      echo "need it"
      echo 'XKBOPTIONS="caps:swapescape"' | sudo tee --append $keyboard_file
    fi
  else
    echo "Swap capslock with escape FAIL"
  fi
}


sudo add-apt-repository ppa:agornostal/ulauncher
sudo add-apt-repository ppa:caffeine-developers/ppa
install_apt
sudo dpkg-reconfigure unattended-upgrades
snap start docker
