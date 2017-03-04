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

function open_file {
	is_installed xdg-open && (xdg-open $url) &> /dev/null
}
