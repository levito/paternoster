### The Right Prompt
function rprompt_time() {
	echo -n "%F{242}$(date +%H:%M:%S)%f"
}

function rprompt_git_status() {
	if [ -d './.git' ]; then
		GIT_USER=$(git config --get user.email)
		echo -n "%F{yellow}%f %F{242}$GIT_USER%f  "
	fi
}

function rprompt_jenv_status() {
	if $(type jenv >/dev/null 2>&1); then
		if [ -f './pom.xml' ]; then
			JENV_INFO=$(jenv version-name);
			echo -n "%F{blue}%%f %F{242}$JENV_INFO%f  "
		fi
	fi
}

function rprompt_rvm_status() {
	if $(type rvm >/dev/null 2>&1); then
		if [ -f './Gemfile' ]; then
			RVM_INFO=$(rvm current)
			echo -n "%F{red}%f %F{242}$RVM_INFO%f  "
		fi
	fi
}

function rprompt_nvm_status() {
	if $(type nvm >/dev/null 2>&1); then
		if [ -f './package.json' ]; then
			NVM_INFO=$(nvm current)
			echo -n "%F{green}%f %F{242}$NVM_INFO%f  "
		fi
	fi
}

build_rprompt() {
	rprompt_jenv_status
	rprompt_rvm_status
	rprompt_nvm_status
	rprompt_git_status
	rprompt_time
}

RPROMPT='$(build_rprompt)'
