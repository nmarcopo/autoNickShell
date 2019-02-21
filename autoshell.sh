#@param: function to execute on yes/no
function yesno() {
    read yn
    if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
        echo "Backing up your $1 to $1.bak..."
        cp $1 $1.bak
        curl -Ls $@ > $1
    elif [ "$yn" = "a" ] || [ "$yn" = "A"]; then
        echo "Appending to your current $1..."
        curl -Ls $@ >> $1
    fi
}

lsColorsSite="https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS"
params="$HOME/.dircolors $lsColorsSite"
if [ ! -f $HOME/.dircolors ]; then
    echo "downloading dircolors..."
    curl -Ls $lsColorsSite > $HOME/.dircolors
else
    echo "dircolors already exitsts. Overwrite? [y/n/a]"
    yesno $params
fi

bashrcSite="https://raw.githubusercontent.com/nmarcopo/autoNickShell/master/.bashrc"
params="$HOME/.bashrc $bashrcSite"
if [ -f $HOME/.bashrc ]; then
    echo "bashrc already exists. Overwrite? [y/n/a]"
    yesno $params
else
    echo "bashrc does not exist. Downloading to ~/.bashrc..."
    curl -Lso $params
fi
echo "Don't forget to source your bashrc!!!!"

colorsSite="https://raw.githubusercontent.com/blueshirts/darcula/master/colors/darcula.vim"
colorsDir="$HOME/.vim/colors"
if [ ! -d "$colorsDir" ]; then
    echo "creating colors directory..."
    mkdir -p $colorsDir
fi
if [ ! -f $colorsDir/darcula.vim ]; then
    echo "downloading darcula..."
    curl -Lso $colorsDir/darcula.vim $colorsSite
fi

vimrcSite="https://raw.githubusercontent.com/nmarcopo/autoNickShell/master/.vimrc"
if [ ! -f $HOME/.vimrc ]; then
    params="$HOME/.vimrc $vimrcSite"
    echo "vimrc does not exist. Downloading to ~/.vimrc..."
    curl -Lso $params
else
    params="$HOME/.vimrc $vimrcSite"
    echo "vimrc already exists. Overwrite? [y/n/a]"
    yesno $params
fi

