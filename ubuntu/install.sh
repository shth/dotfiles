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

echo "Installing Emacs, evil, evil-org"
sudo snap install emacs --classic
mkdir -p ~/.emacs.d/plugins; git clone https://github.com/somelauw/evil-org.git ~/.emacs.d/plugins/evil-org
git clone https://github.com/emacs-evil/evil ~/.emacs.d/evil

echo "Installing neotree"
git clone https://github.com/jaypei/emacs-neotree.git ~/.emacs.d/plugin/neotree

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing emacs27"
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs27
# required dependencies
apt-get install git ripgrep
# optional dependencies
apt-get install fd-find
echo "Installing emacs doom"
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d/doom
~/.emacs.d/doom/bin/doom install
