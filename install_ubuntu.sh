install_apt () {
  packages="
  build-essential
  zsh vim screen tmux
  git tig mc
  curl wget nmap netcat
  "
  junk_packages="
  coreutils findutils
  rar unrar p7zip p7zip-full
  youtube-dl
  python-pip python3-pip python-virtualenv
  "

  sudo apt-get install -y $packages
  # for package in $packages; do
  # 	echo ------------------------------------------------------------------ $package
  # 	sudo apt-get install -y $package
  # done
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


install_apt
install_keyboard
