# dotfiles

This has all my important dotfiles which define my working environment.

Automation install script inspired by [Jason Yu](https://github.com/ycmjason/dotfiles).

## 🎲 Installation

    git clone --depth=1 https://github.com/kylewelsby/dotfiles ~/.dotfiles
    ~/.dotfiles/install

## 🤖 Testing

This project uses docker to run the `install` script.

    docker build -t dotfiles .
    docker run dotfiles

## 🎓 License

MIT: https://kylewelsby.mit-license.org
