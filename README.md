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

### surround.vim

It's easiest to explain with examples.  Press `cs"'` inside

    "Hello world!"

to change it to

    'Hello world!'

Now press `cs'<q>` to change it to

    <q>Hello world!</q>

To go full circle, press `cst"` to get

    "Hello world!"

To remove the delimiters entirely, press `ds"`.

    Hello world!

Now with the cursor on "Hello", press `ysiw]` (`iw` is a text object).

    [Hello] world!

Let's make that braces and add some space (use `}` instead of `{` for no
space): `cs]{`

    { Hello } world!

Now wrap the entire line in parentheses with `yssb` or `yss)`.

    ({ Hello } world!)

Revert to the original text: `ds{ds)`

    Hello world!

Emphasize hello: `ysiw<em>`

    <em>Hello</em> world!

Finally, let's try out visual mode. Press a capital V (for linewise
visual mode) followed by `S<p class="important">`.

    <p class="important">
      <em>Hello</em> world!
    </p>

This plugin is very powerful for HTML and XML editing, a niche which
currently seems underfilled in Vim land.  (As opposed to HTML/XML
*inserting*, for which many plugins are available).  Adding, changing,
and removing pairs of tags simultaneously is a breeze.

The `.` command will work with `ds`, `cs`, and `yss` if you install
[repeat.vim](https://github.com/tpope/vim-repeat).

> How do I surround without adding a space?

Only the opening brackets—`[`, `{`, and `(`—add a space.  Use a closing
bracket, or the `b` (`(`) and `B` (`{`) aliases.
