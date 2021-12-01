ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

gpgconf --launch dirmngr
gpg --keyserver keyserver.ubuntu.com --recv C35CD0258F1362121AE40479AEE59E1B8CCD1C8D

git config --global gpg.program gpg
git config --global user.email kyle.welsby@shopify.com
git config --global user.signingkey 8CCD1C8D


gpgconf --launch dirmngr

alias dt="dev test --include-branch-commits"
alias dr="dev style --include-branch-commits"
alias ds="./bin/srb typecheck"
alias da="ds ; dr ; dt"
