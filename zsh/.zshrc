# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
plug "twfksh/zsh-ssh-agent"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/exa"
plug "Aloxaf/fzf-tab"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Vim keybindings
export VI_MODE_ESC_INSERT="jk" && plug "zap-zsh/vim"

# Go ENV
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
eval "$(/home/toufiq/.local/bin/mise activate bash)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/toufiq/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# direnv hook
# eval "$(direnv hook zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# mise activate
export MISE_SHELL=zsh
if [ -z "${__MISE_ORIG_PATH:-}" ]; then
  export __MISE_ORIG_PATH="$PATH"
fi
export __MISE_ZSH_PRECMD_RUN=0
export __MISE_ZSH_CHPWD_RAN=0

mise() {
  local command
  command="${1:-}"
  if [ "$#" = 0 ]; then
    command /home/toufiq/.local/bin/mise
    return
  fi
  shift

  case "$command" in
  deactivate|shell|sh)
    # if argv doesn't contains -h,--help
    if [[ ! " $@ " =~ " --help " ]] && [[ ! " $@ " =~ " -h " ]]; then
      eval "$(command /home/toufiq/.local/bin/mise "$command" "$@")"
      return $?
    fi
    ;;
  esac
  command /home/toufiq/.local/bin/mise "$command" "$@"
}

autoload -Uz add-zsh-hook
_mise_hook() {
  eval "$(/home/toufiq/.local/bin/mise hook-env -s zsh)";
}
_mise_hook_precmd() {
  if [[ "${__MISE_ZSH_CHPWD_RAN:-0}" == "1" ]]; then
    export __MISE_ZSH_CHPWD_RAN=0
    return
  fi
  eval "$(/home/toufiq/.local/bin/mise hook-env -s zsh --reason precmd)";
}
_mise_hook_chpwd() {
  export __MISE_ZSH_CHPWD_RAN=1
  eval "$(/home/toufiq/.local/bin/mise hook-env -s zsh --reason chpwd)";
}
add-zsh-hook precmd _mise_hook_precmd
add-zsh-hook chpwd _mise_hook_chpwd

_mise_hook
if [ -z "${_mise_cmd_not_found:-}" ]; then
    _mise_cmd_not_found=1
    [ -n "$(declare -f command_not_found_handler)" ] && eval "${$(declare -f command_not_found_handler)/command_not_found_handler/_command_not_found_handler}"

    function command_not_found_handler() {
        if [[ "$1" != "mise" && "$1" != "mise-"* ]] && /home/toufiq/.local/bin/mise hook-not-found -s zsh -- "$1"; then
          _mise_hook
          "$@"
        elif [ -n "$(declare -f _command_not_found_handler)" ]; then
            _command_not_found_handler "$@"
        else
            echo "zsh: command not found: $1" >&2
            return 127
        fi
    }
fi

# aws-cli options
export AWS_CLI_AUTO_PROMPT=on-partial

. "$HOME/.cargo/env"
