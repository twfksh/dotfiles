fish_add_path -g /home/toufiq/.local/bin /usr/bin /usr/sbin /home/linuxbrew/.linuxbrew/bin /usr/local/go/bin

zoxide init fish | source

if status is-interactive
    for file in ~/progs/dotfiles/fish/abbreviations/*.fish
        source $file
    end
end

fish_ssh_agent
