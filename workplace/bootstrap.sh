echo "extend .zshrc with workplace specific settings"
rm ~/.zshrc
ln -sfnv $PWD/workplace/.zshrc ~/.zshrc

