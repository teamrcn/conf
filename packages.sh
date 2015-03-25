packages="
coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt
zsh vim screen
rar unrar p7zip p7zip-full
git python-pip python3-pip python-virtualenv
tig
curl wget nmap youtube-dl
"

for package in $packages; do
	echo ------------------------------------------------------------------ $package
	sudo apt-get install -y $package
done
