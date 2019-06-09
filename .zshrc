# vim:foldmethod=marker


# {{{ Terminal related stuff
    #ulimit -v 16000000
    #umask 022
    #limit stack 8192
    #limit core 0      # important for a live-cd-system
    #limit -s
    xset b off >/dev/null 2>&1
    #set +h #turns off bash's hash function; Will always detect new programs in PATH
# }}}

# {{{ shell variables
    export EDITOR='vim'
    export PAGER='less'
# }}}

# {{{ shell history
    setopt hist_ignore_dups     # tells the shell not to store a history line if it's the same as the previous one
    setopt append_history       # append history list to the history file (important for multiple parallel zsh sessions!)
    setopt extended_history     # save each command's beginning timestamp and the duration to the history file
    HISTFILE="$HOME/.zsh_history"
    HISTSIZE=500000
    SAVEHIST=500000 # useful for setopt append_history
# }}}

# {{{ shell PATH
    export MANPATH="${MANPATH}:/usr/local/man:/usr/man:${HOME}/public/man:${HOME}/local/man"
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:/sbin:/usr/sbin:/usr/local/sbin;/usr/local/bin:${HOME}/local/bin:$PATH"
#export CLASSPATH="/usr/share/tomcat5.5/server/lib:/usr/share/tomcat5.5/common/lib:/usr/share/tomcat5.5/common/lib/servlet-api.jar:~/mysql-connector-java-5.1.6-bin.jar:"
# }}}

# {{{ shell aliases
#alias f="ls -l --color=auto"
    #f() { ls -lG --color=auto --classify --indicator-style=slash --escape "$@"   }
    alias v="vim -O"

    unalias rm 2> /dev/null
    unalias mv 2> /dev/null
    unalias cp 2> /dev/null
    unalias lo 2> /dev/null

    setopt auto_name_dirs # initialize named dirs automagically
    #hash -d dos=/media/sda8 # now you can "cd ~dos"


    function c(){
        #instead of "cd dir, ls -l" all the time, use this macro
        if [ $# -eq 1 ] && [ -d $1 ] 
        then
            cd "$1" && ls -lG --color=auto --classify --indicator-style=slash  --group-directories-first --escape 
        else
            ls -lG --color=auto --classify --indicator-style=slash  --group-directories-first --escape "$@"
        fi
    }
    function ~() { c ~  }
    function /() { c /  }
    function ..() { c ..  }
    function ...() { c ../..  }
    function ....() { c ../../..  }
    function pycd () { pushd `python -c "import os.path, $1; print(os.path.dirname($1.__file__))"`; }
    function ip(){ dig +short myip.opendns.com @resolver1.opendns.com; }

    alias zzsshmicro='ssh 137.132.80.193 -l deviant'
# }}}

# {{{ shell autorun
    mkdir /tmp/z 2>/dev/null # I like to set /tmp/z as my personal temp dir 
# }}}


# {{{ zsh options
    export ZSHDIR=$HOME/.zsh
    setopt nobeep
    setopt auto_cd              # if a command is issued that can't be executed as a normal command,
                                # and the command is the name of a directory, perform the cd command to that directory
    setopt NO_clobber           # warning if file exists ('cat /dev/null > ~/.zshrc')
    setopt notify               # report the status of backgrounds jobs immediately
    # setopt dvorak               # with spelling correction, assume dvorak kb
    setopt extended_glob        # exteneded glob examples :
                                #  ls -d /usr/src/linux/**/*(/) lists all the directories in /usr/src/linux 
                                #  ls -d /usr/src/linux/**/*(@) lists all the symlinks in it 
                                #  ls /usr/src/linux/**/*(*) lists the executable files in it 
                                #  ls /**/*(s) lists all the setuid files on your system - great for a security audit 
                                #  ls -d /**/*(u:kmccarty:) lists all the files owned by kmccarty 
                                #  ls -d /**/*(m-10) lists all the files modified within the last 10 days
    ZLS_COLORS=$LS_COLORS
    compinit
# }}}

# {{{ zsh autocompletion options
    autoload -U compinit
    # command for process lists, the local web server details and host completion
    # on processes completion complete all user processes
    zstyle ':completion:*:processes' command 'ps -au$USER'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
    zstyle ':completion:*' menu select=1 _complete _ignored _approximate
    # Filename suffixes to ignore during completion (except after rm command)
    zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro'
    # ignore completion functions (until the _ignored completer)
    zstyle ':completion:*:functions' ignored-patterns '_*'
    zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
    zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
    zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
    zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
    zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
#  local _myhosts
#  _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
#  zstyle ':completion:*' hosts $_myhosts
    [ -f "$HOME/.ssh/known_hosts" ] && \
    hosts=(${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*}) && \
    zstyle ':completion:*:hosts' hosts $hosts
    zstyle '*' single-ignored show
# }}}

# {{{ zsh prompt
    local grey="%{$(echo -n '\e[1;30m')%}"
    local red="%{$(echo -n '\e[1;31m')%}"
    local green="%{$(echo -n '\e[1;32m')%}"
    local yellow="%{$(echo -n '\e[1;33m')%}"
    local blue="%{$(echo -n '\e[1;34m')%}"
    local magenta="%{$(echo -n '\e[1;35m')%}"
    local cyan="%{$(echo -n '\e[1;36m')%}"
    local white="%{$(echo -n '\e[1;37m')%}"
    local lored="%{$(echo -n '\e[0;31m')%}"
    local logreen="%{$(echo -n '\e[0;32m')%}"
    local loyellow="%{$(echo -n '\e[0;33m')%}"
    local loblue="%{$(echo -n '\e[0;34m')%}"
    local lomagenta="%{$(echo -n '\e[0;34m')%}"
    local locyan="%{$(echo -n '\e[0;35m')%}"
    local lowhite="%{$(echo -n '\e[0;36m')%}"
    local logrey="%{$(echo -n '\e[0;37m')%}"

    local BLUE="%{.[1;34m%}"
    local RED="%{.[1;31m%}"
    local GREEN="%{.[1;32m%}"
    local cyan="%{.[1;36m%}"
    local NO_COLOUR="%{.[0m%}"


    function git_prompt
    {
        if [ ! -d ~/.github/zsh-git-prompt ]; then
            echo mkdir
            mkdir -p ~/.github > /dev/null 2> /dev/null
            git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.github/zsh-git-prompt
        fi
        source ~/.github/zsh-git-prompt/zshrc.sh
        ZSH_THEME_GIT_PROMPT_PREFIX=""
        ZSH_THEME_GIT_PROMPT_SUFFIX=""
        ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
        ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%}"
        ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
        ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
        ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
        ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
        ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
        ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
        ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

        PS_git="${green}Git:${white}["'$(git_super_status)'"${white}]"
    }
    git_prompt

    function generate_prompt
    {
        local    user="[${green}%n${white}@${green}%m${white}]"
        local    jobs="${green}Jobs:${white}[${yellow}%j${white}]"
        local    date="${green}Date:${white}[${yellow}%D{%a %Y/%m/%d} %* %D{%s}${white}]"
        local history="${green}History:${white}[${yellow}%!${white}]"
        local  bottom="${green}%~${white}%#"
        local   rcode="${green}Return:${white}[${yellow}%?${white}]"
        local   shlvl="${green}ShellLvl:${white}[${yellow}%L${white}]"
    #The return code of the last command  executed just before the prompt.
        PROMPT="${user}${bottom}"
        RPROMPT="${PS_git} ${shlvl} ${rcode} ${jobs} ${history} ${date}"
    }
    generate_prompt
# }}}


# {{{ old bash stuff
    #export HISTFILESIZE=9999
    #export HISTSIZE=9999
    #export HISTCONTROL="ignoredups" # dont save already entered commands 
    #export FIGNORE='.bck:bak:~' # ignored ext for completion
    #TAB completion will only complete on directories when used with cd: 
    #complete -d cd
    export HISTCONTROL="ignoredups" # dont save already entered commands 
    export FIGNORE='.bck:bak:~' # ignored ext for completion
    #complete -d cd #tab completion. for bash
    # old bash prompt
    function elite
    {
        local GRAY="\[\033[1;30m\]"        #black
        local LIGHT_GRAY="\[\033[0;37m\]"  #white
        local CYAN="\[\033[0;36m\]"        #cyan
        local LIGHT_CYAN="\[\033[1;36m\]"  #cyan
        local NO_COLOUR="\[\033[0m\]"

        case $TERM in
            xterm*|rxvt*)
                local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
                ;;
            *)
                local TITLEBAR=""
                ;;
        esac

        local temp=$(tty)
        local GRAD1=${temp:5}

        PS1="$TITLEBAR\
        $GRAY-$CYAN-$LIGHT_CYAN(\
        $CYAN\u$GRAY@$CYAN\h\
        $LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
        $CYAN\#$GRAY/$CYAN$GRAD1\
        $LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
        $CYAN\$(date +%H%M)$GRAY/$CYAN\$(date +%d-%b-%y)\
        $LIGHT_CYAN)$CYAN-$GRAY-\
        $LIGHT_GRAY\n\
        $GRAY-$CYAN-$LIGHT_CYAN(\
        $CYAN\$$GRAY:$CYAN\w\
        $LIGHT_CYAN)$CYAN-$GRAY-$NO_COLOUR "
        PS2="$LIGHT_CYAN-$CYAN-$GRAY-$NO_COLOUR "
    }
# }}}


# {{{ keybindings
    bindkey '\e[1~' beginning-of-line       # home
    bindkey '\e[4~' end-of-line             # end
    bindkey '^A' beginning-of-line       # home
    bindkey '^E' end-of-line       # home
    bindkey "^[[A" history-beginning-search-backward
    bindkey "^[[B" history-beginning-search-forward
    #bindkey '^x'    history-beginning-search-backward
    [[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      history-search-backward
    [[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    history-search-forward
    [[ -n "${key[Up]}"      ]] && bindkey  "${key[Up]}"      history-beginning-search-backward
    [[ -n "${key[Down]}"    ]] && bindkey  "${key[Down]}"    history-beginning-search-forward
    case $TERM in (xterm*)
	bindkey '\e[H' beginning-of-line
	bindkey '\e[F' end-of-line ;;
    esac
    autoload -U up-line-or-beginning-search
    autoload -U down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "^[[A" up-line-or-beginning-search # Up
    bindkey "^[[B" down-line-or-beginning-search # Down
# }}}

# {{{ Program specific settings
    #export GCC_BOUNDS_OPTS=-no-message
    #    export GREP_OPTIONS="--colour=always  --line-number"
    # alias g="grep --colour=always  --line-number"
    export CLICOLOR=1
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
    #    export LESS='-w --clear-screen --force --RAW-CONTROL-CHARS --no-init --quit-if-one-screen --LONG-PROMPT --chop-long-lines --IGNORE-CASE ' 
    #alias l="less -w --clear-screen --force --RAW-CONTROL-CHARS --no-init --quit-if-one-screen --LONG-PROMPT --chop-long-lines --IGNORE-CASE "
    #alias l="less -w --clear-screen --force --RAW-CONTROL-CHARS --no-init  --LONG-PROMPT --chop-long-lines --IGNORE-CASE "
    export LS_COLORS="no=01;36:fi=01;37:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:"
# }}}


# {{{ place custom configs here
    alias dc="docker-compose"
    alias d="docker"
    alias gd="git diff"
    alias gdt="git difftool"
    alias gg="git grep --recurse-submodules"
    alias g="git"
    alias calc="libreoffice --calc"
    export bitbucket="$HOME/z/git/bitbucket.org"
    export github="$HOME/z/git/github.com"
    alias venv="source venv/bin/activate"
# }}}
