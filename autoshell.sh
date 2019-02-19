#@param: function to execute on yes/no
function yesno() {
    read yn
    if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
        echo "Backing up your $1 to $1.bak..."

#        curl -Lso $@
    fi
}

bashrcSite="https://raw.githubusercontent.com/nmarcopo/autoNickShell/master/.bashrc"
params="$HOME/.bashrc $bashrcSite"
if [ -f $HOME/.bashrc ]; then
    echo "bashrc already exists. Overwrite? [y/n]"
    yesno $params
else
    echo "bashrc does not exist. Downloading to ~/.bashrc..."
    curl -Lso $params
fi
source $HOME/.bashrc

colorsSite="https://raw.githubusercontent.com/blueshirts/darcula/master/colors/darcula.vim"
colorsDir="$HOME/.vim/colors"
if [ ! -d "$colorsDir" ]; then
    mkdir -p $colorsDir
fi
curl -Lso $colorsDir/darcula.vim $colorsSite

vimrcSite="https://raw.githubusercontent.com/nmarcopo/autoNickShell/master/.vimrc"
if [ -z "$MYVIMRC" ] && [ ! -f $HOME/.vimrc ]; then
    params="$HOME/.vimrc $vimrcSite"
    echo "vimrc does not exist. Downloading to ~/.vimrc..."
    curl -Lso $params
else
    if [ -z "$MYVIMRC" ]; then
        site="$MYVIMRC $vimrcSite"
    else
        site="$HOME/.vimrc"
    fi
    echo "vimrc already exists. Overwrite? [y/n]"
    yesno $params
fi

