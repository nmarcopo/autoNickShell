#@param: function to execute on yes/no
function yesno() {
    read yn
    if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
        echo $@
        #curl -Lso $@
    fi
}

bashrcSite="bashrcsite.com"
params="~/.bashrc $bashrcSite"
if [ -f ~/.bashrc ]; then
    echo "bashrc already exists. Overwrite? [y/n]"
    yesno $params
else
    echo "bashrc does not exist. Downloading to ~/.bashrc..."
    curl -Lso $params
fi
source ~/.bashrc

colorsSite="colors.com"
colorsDir="~/.vim/colors"
if [ ! -d "$colorsDir" ]; then
    mkdir -p $colorsDir
fi
curl -Lso $colorsDir/darcula.vim $colorsSite

vimrcSite="vimrcsite.com"
if [ -z "$MYVIMRC" ]; then
    params="~/.vimrc $vimrcSite"
    echo "vimrc does not exist. Downloading to ~/.vimrc..."
    curl -Lso $params
else
    site="$MYVIMRC $vimrcSite"
    echo "vimrc already exists. Overwrite? [y/n]"
    yesno $params
fi

