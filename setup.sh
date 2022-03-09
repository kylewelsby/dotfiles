ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

git config --global gpg.program gpg
git config --global user.email kyle.welsby@shopify.com

gpgconf --launch dirmngr

alias dt="dev test --include-branch-commits"
alias dr="dev style --include-branch-commits"
alias ds="./bin/srb typecheck"
alias da="ds ; dr ; dt"

echo -e "\n\033[0;32mKyle Welsby's dotfiles Installed\033[0m\n"
