export PS1="\[\e[33m\]\u\[\e[0m\]@\[\e[32m\]\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] :: "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacGx

#Git
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias terminal='source ~/.bash_profile'
alias finder='open `pwd`'

alias s="git status -s"
alias b="git branch"
alias ba="git branch -a"
alias logg="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias glog="git log --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --date=short"
alias ref="git reflog"
alias com="git checkout master"
alias cod="git checkout development"
alias pull="git pull -r $1"
alias new="git checkout -b $1"
alias gc='git checkout'
alias mod="git submodule update --init --recursive"
alias clean='git branch | egrep -ve "(master|development|\*)" | xargs git branch -D; git remote prune origin'


#Hierarchy Viewer Variable
export ANDROID_HVPROTO=ddm

#android adb
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#Git auto-complete
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi


alias cd..='cd ..'
alias home='cd ~'
alias l='ls -FGlAhp'
alias wget='curl -O'
# copypath copies in in clipboard current terminal path
alias pwdcopy='pwd|pbcopy'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias myip='curl ip.appspot.com'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias sudotext='openTextEditorAsSU'
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias show-hidden-files='changeFilesVisibilty TRUE'
alias hide-hidden-files='changeFilesVisibilty FALSE'

function changeFilesVisibilty(){
  defaults write com.apple.finder AppleShowAllFiles -bool $@
  killall Finder
}

############################################################################
#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#   Note that the command name can be specified via a regex
#   E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#   Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }

############################################################################
#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

############################################################################
# opens favourite text editor as super user (Sublime text instead of TextWrangler)
function openTextEditorAsSU(){
  cd /Applications/Sublime\ Text.app/Contents/MacOS/
  sudo ./Sublime\ Text 
}

############################################################################
function setjdk() {  
  if [ $# -ne 0 ]; then  
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'  
    if [ -n "${JAVA_HOME+x}" ]; then  
      removeFromPath $JAVA_HOME  
    fi  
    export JAVA_HOME=`/usr/libexec/java_home -v $@`  
    export PATH=$JAVA_HOME/bin:$PATH  
  fi }
   
  ############################################################################
   function removeFromPath() {  
   export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")  
  }
   


############################################################################
# office paths
export DEV_HOME=~/Dev
export PATH=$PATH:$DEV_HOME

export M2_HOME=/Users/NAME/Dev/MAVEN
export PATH=$PATH:$M2_HOME/bin

export JBOSS_HOME=$DEV_HOME/COMPANY_NAME/SERVERS/jboss-eap-6.x
export PATH=$PATH:$JBOSS_HOME/bin

export MONGODB_HOME=$DEV_HOME/COMPANY_NAME/SERVERS/mongodb
export PATH=$PATH:$MONGODB_HOME/bin


############################################################################
# prevent .ds_store files from being written on network
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
# sets java default version
setjdk 1.8
############################################################################

export PATH="$PATH:$HOME/.composer/vendor/bin"
