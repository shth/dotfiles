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
brew install emacs
brew linkapp emacs

echo "Installing Emacs, evil, evil-org"
mkdir -p ~/.emacs.d/plugins; git clone https://github.com/somelauw/evil-org.git ~/.emacs.d/plugins/evil-org
git clone https://github.com/emacs-evil/evil ~/.emacs.d/evil

echo "Installing dircolors"
git clone https://github.com/seebi/dircolors-solarized.git ./libraries/dircolors-solarized
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

echo "Installing yabai"
brew install koekeishiya/formulae/yabai
sudo yabai --install-sa
sudo yabai --load-sa
brew services start yabai

echo "Installing skhd"
brew install koekeishiya/formulae/skhd
brew services start skhd

# follow instructions
echo "If you're using macOS Big Sur, follow the instructions here: https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#macos-big-sur---automatically-load-scripting-addition-on-startup"
