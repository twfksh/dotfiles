set -U fish_user_paths $fish_user_paths ~/.local/bin ~/.local/bin/jdk-22.0.1/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_ssh_agent
