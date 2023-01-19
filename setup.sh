ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

git config --global --unset gpg.program
git config --global user.email kyle.welsby@shopify.com

gpgconf --launch dirmngr

curl -sS https://starship.rs/install.sh | sh

echo -n "export GPG_TTY=$(tty)" >> ~/.zshrc
echo -n "eval \"$(starship init zsh)\"" >> ~/.zshrc

alias dt="dev test --include-branch-commits"
alias dr="dev style --include-branch-commits"
alias ds="./bin/srb typecheck"
alias da="ds ; dr ; dt"

echo -e "\n\033[0;32mKyle Welsby's dotfiles Installed\033[0m\n"
