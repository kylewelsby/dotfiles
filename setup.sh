ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

git config --global --unset gpg.program
git config --global user.email kyle.welsby@shopify.com
git config --global user.signingkey C35CD0258F1362121AE40479AEE59E1B8CCD1C8D

gpgconf --launch dirmngr

echo -n "export GPG_TTY=$(tty)" >> ~/.zshrc

alias dt="dev test --include-branch-commits"
alias dr="dev style --include-branch-commits"
alias ds="./bin/srb typecheck"
alias da="ds ; dr ; dt"

echo -e "\n\033[0;32mKyle Welsby's dotfiles Installed\033[0m\n"
