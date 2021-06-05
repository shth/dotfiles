#echo "sync up neo vim init.vim"
#ln -s /mnt/c/Users/shthf/AppData/Local/nvim/ $PWD/wsl
#cp init.vim $PWD/wsl/nvim/init.vim

echo "extend .zshrc with wsl specific settings"
rm ~/.zshrc
ln -sfnv $PWD/wsl/.zshrc ~/.zshrc

