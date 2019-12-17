# use this mapping to google what each package does
# map <leader>g :!chrome-cli open "https://www.google.com/search?q=<C-R><C-W> github"<CR>

brew update && brew upgrade

brew install awscli
brew install fzf
brew install git
brew install httpie
brew install hub
brew install mongodb
brew install node
brew install openssl
brew install python
brew install python@2
brew install ruby
brew install the_silver_searcher
brew install tmux
brew install vim
brew install yarn
brew install zsh

# oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing TPM(tmux package manager)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing dircolors"
git clone https://github.com/seebi/dircolors-solarized.git ./libraries/dircolors-solarized

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
