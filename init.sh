#!/bin/bash
/usr/local/bin/brew tap sambadevi/powerlevel9k && \

/usr/local/bin/brew install \
    telnet \
    node \
    powerlevel9k && \

/usr/local/bin/brew cask install \
    docker \
    iterm2 \
    gitkraken \
    google-chrome \
    visual-studio-code \
    slack && \

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
