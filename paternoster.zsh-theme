### The Right Prompt
# function find-up() {
# 	_path=$PWD
# 	while [[ "$_path" != "" && ! -e "$_path/$1" ]]; do
# 		_path=${_path%/*}
# 	done
# 	echo "$_path"
# }

function rprompt_time() {
	echo -n "%F{gray}%f %F{242}$(date +%H:%M:%S)%f"
}

function rprompt_git_status() {
	if $(git rev-parse &> /dev/null); then
		GIT_USER=$(git config --get user.email)
		echo -n "%F{yellow}%f %F{242}$GIT_USER%f  "
	fi
}

function rprompt_jenv_status() {
	if $(type jenv &> /dev/null); then
		if test $(find-up pom.xml) || test $(find-up build.xml) || test $(find-up build.gradle); then
			JENV_INFO=$(jenv version-name)
			echo -n "%F{blue}%f %F{242}$JENV_INFO%f  "
		fi
	fi
}

function rprompt_rvm_status() {
	if $(type rvm &> /dev/null); then
		if test $(find-up Gemfile); then
			RVM_INFO=$(rvm current)
			echo -n "%F{red}%f %F{242}$RVM_INFO%f  "
		fi
	fi
}

function rprompt_node_version() {
	if $(type node &> /dev/null); then
		if test $(find-up package.json); then
			NODE_INFO=$(node -v)
			echo -n "%F{green}%f %F{242}$NODE_INFO%f  "
		fi
	fi
}

build_rprompt() {
	rprompt_jenv_status
	rprompt_rvm_status
	rprompt_node_version
	rprompt_git_status
	rprompt_time
}

RPROMPT='$(build_rprompt)'
