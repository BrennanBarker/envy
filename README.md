# envy
A dead-simple wrapper for managing Python's venv virtual environments.

## Why?
Python has [a wonderful module](https://docs.python.org/3/library/venv.html) in
its standard library called `venv`.

`venv` is great at what it does; that is: "create virtual environments to
isolate the packages for your various projects from one another."

That being said, `venv` isn't an environment *manager*, nor does it claim to
be. It doesn't copy, remove, rename, or list envs, the kind of stuff most
normal folks want from an environment manager. Heck, it doesn't even provide a
facility for activating the virtual environments it creates.

This is where `envy` comes in. A dead-simple way to manage your venvs,
providing just the utilities that people desire most.

## Why not `virtualenvwrapper`?
[`virtualenvwrapper`](https://virtualenvwrapper.readthedocs.io/en/latest/index.html)
is a Python virtual environment wrapper that is also great at what it does;
perhaps too good. `virtualenvwrapper` provides facilities for not only the most
common venv operations, but also for managing venvs automatically via hooks
that interact with git, tab completion, etc.

If you have a use for that stuff, please go use this excellent tool.

But if you're like most people, you don't need 1000 lines of code to make,
copy, rename, or list your venvs -- you want soemthing dead simple; a
minimal library you can source into your shell and be off to the races.  That's
`envy`.

## How?
As a couple of shell functions and aliases, `envy` isn't installed, per-se.
Simply clone this repo, and source it in your shell's config file (`.bashrc`,
`.zshrc`, or symlink it in `.oh-my-zsh/custom/`, etc.).  For example:

    $ cd <where-you-want-envy-to-live>
    $ clone https://github.com/BrennanBarker/envy.git
    # open your shell's config file and add: #
    source <where-you-want-envy-to-live>/envy/envy.sh

`envy` puts all venvs in a single folder, by default `~/code/envs`. You can
change this by editing the value of `$ENVS` in the `envy.sh` script.  In fact,
I encourage you to take a look at the script and change anything you want; it's
only a couple dozen lines of code!
