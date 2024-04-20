fish_add_path -g /home/toufiq/.local/bin /usr/bin /usr/sbin /home/linuxbrew/.linuxbrew/bin /usr/local/go/bin /usr/lib

zoxide init fish | source

fish_config theme choose "Rosé Pine Moon"

set -g tide_character_color f6c177
set -g tide_character_color_failure f6c177
set -g tide_character_icon '>>>'
set -g tide_character_vi_icon_default '>>>'
set -g tide_character_vi_icon_replace '>>>'
set -g tide_character_vi_icon_visual '>>>'

if status is-interactive
    for file in ~/progs/dotfiles/fish/abbreviations/*.fish
        source $file
    end
end

fish_ssh_agent
