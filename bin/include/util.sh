function ensure_presence_of {
	for dependency in $@; do
		if ! hash $dependency 2> /dev/null; then
			echo "$dependency is not installed"
			exit 1
		fi
	done
}

function is_installed {
	hash $1 2> /dev/null
}

function ensure_presence_of_any {
	for dependency in $@; do
		if hash $dependency 2> /dev/null; then
			echo $dependency
			return 0;
		fi
	done

	echo "You need at least one of the following dependencies installed: [ $@ ]"
	exit 1
}

# Attempt to open a file with a default associated program
function open_file {
	is_installed xdg-open && (xdg-open $url) &> /dev/null
	is_installed open && (open $url) &> /dev/null
}

# Attempt to copy something to clipboard. Will fail silently if the supported
# clipboard utilities are not found.
#
# Supports:
# - xclip
# - pbpaste
function copy_to_clipboard {
	is_installed xclip && echo $1 | xclip -selection c
	is_installed pbcopy && echo $1 | pbcopy
}

# Attempt to display a notification to the user. Will fail silently if the
# supported utilities are not found. Supports passing arbitrary args to
# notify-send.
#
# Supports:
# - notify-send (Linux)
# - osascript (MacOS)
#
# Usage:
# notify $title $contents $notify_send_args
function notify {
	is_installed notify-send && notify-send $2 $@[2,-1]
	is_installed osascript && osascript -e "display notification \"$1\" with title \"$2\""
}

function strip {
	grep -oE '\S.+\S'
}

# Logging utilities
function say {
	echo '--> ' $1
}

# ||=
function default {
	# TODO:
}
