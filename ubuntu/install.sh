# use this mapping to google what each package does
# map <leader>g :!chrome-cli open "https://www.google.com/search?q=<C-R><C-W> github"<CR>

sudo apt update && sudo apt upgrade -y

sudo apt install fzf
sudo apt install git
sudo apt install httpie
# installing nodejs
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install nodejs

sudo apt install ruby

# this requires Ubuntu v18.10.0 or above
sudo apt-get install ripgrep

sudo apt install tmux

# install vim-gtk for clipboard support
sudo apt install vim-gtk

sudo apt install zsh

# oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
