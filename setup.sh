ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

gpgconf --launch dirmngr
gpg --keyserver keyserver.ubuntu.com --recv C35CD0258F1362121AE40479AEE59E1B8CCD1C8D

git config --global gpg.program gpg
git config --global user.email kyle.welsby@shopify.com
git config --global user.signingkey AEE59E1B8CCD1C8D


gpgconf --launch dirmngr
