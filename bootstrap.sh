echo "Backing up existing files..."
mv -iv ~/.gitconfig ~/.gitconfig.default
mv -iv ~/.tmux.conf ~/.tmux.conf.default
mv -iv ~/.vimrc ~/.vimrc.default
mv -iv ~/.zshrc ~/.zshrc.default 

echo "Adding symlinks..." 
ln -sfnv $PWD/.gitconfig ~/.gitconfig
ln -sfnv $PWD/.tmux.conf ~/.tmux.conf
ln -sfnv $PWD/.vimrc ~/.vimrc
ln -sfnv $PWD/.zshrc ~/.zshrc
