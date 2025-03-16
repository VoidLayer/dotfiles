# Dotfiles

This repository contains my personal configuration files (dotfiles) for my development environment.

## Installation

To set up these dotfiles on a new system, follow these steps:

### 1. Clone the Repository

```sh
# Using SSH
git clone git@github.com:VoidLayer/dotfiles.git ~/dotfiles

# Or using HTTPS (if SSH is not configured)
git clone https://github.com/VoidLayer/dotfiles.git ~/dotfiles
```

### 2. Create Symbolic Links

Run the following commands to symlink the configuration files:

```sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

### 3. Reload Configuration

For changes to take effect, reload your shell configuration:

```sh
source ~/.zshrc
```

## Contents

- `.zshrc` - Configuration for Zsh shell.
- `.tmux.conf` - Configuration for tmux (if present in the repository).

## Usage

These dotfiles help configure the development environment with preferred shell settings, aliases, and tmux configurations.

## Contributing

Feel free to fork and modify these dotfiles to suit your own preferences!

## License

MIT License. See [LICENSE](LICENSE) for details.


