### Installation:

    git clone git://github.com/flyrry/dotvim.git ~/.vim

##### For fuzzy-search support:

    brew install fzf

##### For fast and smart C++ indexing/browsing:

    brew install rtags

### Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

##### If using neovim:

    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim

### Switch to the ~/.vim directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
