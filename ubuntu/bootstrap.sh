source ./install.sh

echo "Backing up existing files..."
mv -ivn ~/.gitconfig ~/.gitconfig.default
mv -ivn ~/.tmux.conf ~/.tmux.conf.default
mv -ivn ~/.vimrc ~/.vimrc.default
mv -ivn ~/.zshrc ~/.zshrc.default 

echo "Adding symlinks..." 
ln -sfnv ../.gitconfig ~/.gitconfig
ln -sfnv ../.tmux.conf ~/.tmux.conf
ln -sfnv ../.vimrc ~/.vimrc
ln -sfnv ../.zshrc ~/.zshrc
