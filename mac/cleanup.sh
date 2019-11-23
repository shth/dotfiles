echo "Restoring default files..."
mv -iv ~/.gitconfig.default ~/.gitconfig
mv -iv ~/.tmux.conf.default ~/.tmux.conf
mv -iv ~/.vimrc.default ~/.vimrc
mv -iv ~/.zshrc.default ~/.zshrc
rm -rf ~/.config
rsync -av ~/.config.default/ ~/.config/
rm -rf ~/.config.default
