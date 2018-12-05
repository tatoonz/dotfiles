#!/bin/bash

################## Install brew ###############
if command -v brew > /dev/null; then
    echo "brew is already installed."
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

################# Install oh my zsh ##################################
if [ -d ~/.oh-my-zsh ]; then
    echo "Oh my zsh is already installed."
else
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

ZSH_PATH_PATTERN="export PATH=\$HOME\/bin:"
if cat ~/.zshrc | grep "# $ZSH_PATH_PATTERN" > /dev/null
then
    cat ~/.zshrc | sed "s/# $ZSH_PATH_PATTERN/$ZSH_PATH_PATTERN/" | tee ~/.zshrc > /dev/null
    echo "Add zsh bin path"
fi

################## Install dependencies ###############
/usr/local/bin/brew tap sambadevi/powerlevel9k && \

/usr/local/bin/brew install \
    telnet \
    node

/usr/local/bin/brew cask install \
    docker \
    gitkraken \
    google-chrome \
    iterm2 \
    postman \
    slack \
    visual-studio-code

################# Install VSCode command ########################
VS_CODE_BIN="export PATH=\$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"
if cat ~/.zshrc | grep "export PATH=\$PATH:/Applications/Visual" > /dev/null; then
    echo "vscode bin path was added."
else
    echo "\n# VSCode bin path\n$VS_CODE_BIN\n" | cat - ~/.zshrc > temp && mv temp ~/.zshrc
    echo "Add vscode bin path."
fi

################# Install zsh theme ########################
if [ -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    echo "Powerlevel9k theme was installed"
else
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if cat ~/.zshrc | grep 'ZSH_THEME="robbyrussell"' > /dev/null
then
    cat ~/.zshrc | sed 's/ZSH_THEME\=\"robbyrussell\"/ZSH_THEME\=\"powerlevel9k\/powerlevel9k\"/' | tee ~/.zshrc > /dev/null
    echo "Change zsh theme to powerlevel9k"
fi