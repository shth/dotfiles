source ./install.sh

echo "Backing up existing files..."
mv -ivn ~/.gitconfig ~/.gitconfig.default
mv -ivn ~/.tmux.conf ~/.tmux.conf.default
mv -ivn ~/.vimrc ~/.vimrc.default
mv -ivn ~/.zshrc ~/.zshrc.default 
rsync -av ~/.config/ ~/.config.default/ 

echo "Adding symlinks..." 
ln -sfnv $PWD/.gitconfig ~/.gitconfig
ln -sfnv $PWD/.tmux.conf ~/.tmux.conf
ln -sfnv $PWD/.vimrc ~/.vimrc
ln -sfnv $PWD/.zshrc ~/.zshrc
rm -rf ~/.config
ln -sfnv $PWD/.config ~/.config
