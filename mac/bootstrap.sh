source $PWD/mac/install.sh

echo "Installing Emacs, evil, evil-org"
mkdir -p ~/.emacs.d/plugins; git clone https://github.com/somelauw/evil-org.git ~/.emacs.d/plugins/evil-org
git clone https://github.com/emacs-evil/evil ~/.emacs.d/evil

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
ln -sfnv $PWD/.emacs ~/.emacs
