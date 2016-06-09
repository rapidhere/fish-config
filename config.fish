# greeting message
function fish_greeting
	printf "Welcome back, "
	set_color 66d9ef
	printf "%s@%s\n" $USER (hostname)

	set_color normal
	printf "System usages:\n"
	uptime

	printf "\n===> Glory to the firstborn! <===\n"
end

# Path to your oh-my-zsh installation.
### Turn on 256 color
if [ "$TERM" = 'xterm' ]
	set -x TERM xterm-256color
end

### 256 color detect
if [ "$TERM" = 'xterm-256color' ] or [ "$TERM" = 'screen-256color' ]
	set TERM_256COLOR true
else
	set TERM_256COLOR false
end

if [ TERM_256COLOR ]
	# [ -e "$HOME/.dircolors" ] or set DIR_COLORS "$HOME/.dircolors"
	# [ -e "$DIR_COLORS" ] or set DIR_COLORS ""
	# dircolors -b $DIR_COLORS > /dev/null
end

### Run pythonbrew
[ -s "$HOME/.pythonbrew/etc/bashrc" ] and source "$HOME/.pythonbrew/etc/bashrc"

### Paths
set PATH $PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /home/rapid/lib/android-sdk-linux/tools/ /home/rapid/lib/android-sdk-linux/platform-tools/
set PATH $PATH /home/rapid/bin
set PATH /home/rapid/work/sys/simplescalar/bin $PATH
set PATH /home/rapid/work/sys/simplescalar/simplesim-3.0 $PATH

# Android configs
set -x ANDROID_HOME /home/rapid/lib/android-sdk-linux
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:$ANDROID_HOME/tools/lib

# For golang
set -x GOPATH /home/rapid/lib/golang

set -x PYTHONPATH $PYTHONPATH /home/rapid/repo/xiaoyou/hapi_services
