source $PWD/mac/install.sh

echo "Installing TPM(tmux package manager)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing dircolors"
git clone https://github.com/seebi/dircolors-solarized.git ./libraries/dircolors-solarized

echo "Backing up existing files..."
mv -ivn ~/.gitconfig ~/.gitconfig.default
mv -ivn ~/.tmux.conf ~/.tmux.conf.default
mv -ivn ~/.vimrc ~/.vimrc.default
mv -ivn ~/.zshrc ~/.zshrc.default 
mv -ivn ~/.emacs ~/.emacs.default 

echo "Adding symlinks..." 
ln -sfnv $PWD/.gitconfig ~/.gitconfig
ln -sfnv $PWD/.tmux.conf ~/.tmux.conf
ln -sfnv $PWD/.vimrc ~/.vimrc
ln -sfnv $PWD/.zshrc ~/.zshrc
ln -sfnv $PWD/libraries/dircolors-solarized/dircolors.256dark ~/dircolors.256dark
ln -sfnv $PWD/.emacs ~/.emacs
