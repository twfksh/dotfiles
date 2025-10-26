# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
plug "twfksh/zsh-ssh-agent"
plug "zap-zsh/zap-prompt"

# Load and initialise completion system
autoload -Uz compinit
compinit

# for managing ssh-agent
zsh-ssh-agent

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
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="/home/toufiq/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# direnv hook
eval "$(direnv hook zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
