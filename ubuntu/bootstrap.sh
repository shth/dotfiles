source $PWD/ubuntu/install.sh

echo "Backing up existing files..."
mv -ivn ~/.gitconfig ~/.gitconfig.default
mv -ivn ~/.tmux.conf ~/.tmux.conf.default
mv -ivn ~/.vimrc ~/.vimrc.default
mv -ivn ~/.zshrc ~/.zshrc.default 
mv -ivn ~/.emacs ~/.emacs.default 
mv -ivn ~/.doom.d ~/.doom.d.default 

echo "Adding symlinks..." 
ln -sfnv $PWD/.gitconfig ~/.gitconfig
ln -sfnv $PWD/.tmux.conf ~/.tmux.conf
ln -sfnv $PWD/.vimrc ~/.vimrc
ln -sfnv $PWD/.zshrc ~/.zshrc
ln -sfnv $PWD/.emacs ~/.emacs
ln -sv $PWD/emacs/.doom.d/ ~/
