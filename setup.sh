ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

git config --global --unset gpg.program
git config --global user.email kyle.welsby@shopify.com
git config --global user.signingkey D69BD90129FFC2A75D0D2067E1BFC46736BEC2DE

gpgconf --launch dirmngr

alias dt="dev test --include-branch-commits"
alias dr="dev style --include-branch-commits"
alias ds="./bin/srb typecheck"
alias da="ds ; dr ; dt"

echo -e "\n\033[0;32mKyle Welsby's dotfiles Installed\033[0m\n"
