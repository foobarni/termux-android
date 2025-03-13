#!/data/data/com.termux/files/usr/bin/bash

# Enable SSH support
GPG_AGENT_CONF="$HOME/.gnupg/gpg-agent.conf"
if grep -q "^enable-ssh-support$" "$GPG_AGENT_CONF"; then
    echo "SSH support is already enabled in $GPG_AGENT_CONF"
else
    echo "enable-ssh-support" >> "$GPG_AGENT_CONF"
    echo "Added 'enable-ssh-support' to $GPG_AGENT_CONF"
    gpgconf --kill gpg-agent
    gpgconf --launch gpg-agent
    echo "gpg-agent reloaded with SSH support enabled."
fi

cp home/bashrc $HOME/.bashrc
