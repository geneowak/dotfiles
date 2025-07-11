# Dotfiles

## Requirements for neovim setup

1. [fzf](https://github.com/junegunn/fzf/tree/master#installation) for fuzzy searching.

   You can use Homebrew to install it.

   ```
   brew install fzf
   ```

2. [ripgrep](https://github.com/BurntSushi/ripgrep#installation) for super fast grepping

   You can use Homebrew to install it.

   ```
   brew install ripgrep
   ```

## Credits

Credit to [Jess Archer](https://github.com/jessarcher) and [her laracasts course](https://laracasts.com/series/neovim-as-a-php-ide) that helped me get started with neovim.

### Some useful resources

**Tmux**

1. Swap windows in tmux

   If you want to swap the current window with another one, you can use the following command:

   ```
   swap-window -s <source-window> -t <target-window>
   ```

   For example, to swap the current window with window 1, you can use:

   ```
   swap-window -s 3 -t 1
   ```
