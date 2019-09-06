source ./brew.sh

# oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
