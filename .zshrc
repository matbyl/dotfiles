# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mathiasfrithiofsson/.oh-my-zsh"
ZSH_THEME="spaceship"

plugins=(git autojump docker git zsh-nvm)

source $ZSH/oh-my-zsh.sh

# Autojump
[[ -s /home/mathiasfrithiofsson/.autojump/etc/profile.d/autojump.sh ]] && source /home/mathiasfrithiofsson/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

if [ -e /home/mathiasfrithiofsson/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mathiasfrithiofsson/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

function awskey() {
    echo $2 > /tmp/awskeytmp
    aws kms encrypt --key-id $1 --plaintext fileb:///tmp/awskeytmp --output text --query CiphertextBlob
}

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
