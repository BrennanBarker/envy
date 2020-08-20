# envy
A dead-simple wrapper for managing Python virtual environments.

# What?
`envy` is a *small* library--just two shell functions and two environment
variables--intended to help manage Python virtual environments, with facilities
for making, copying, removing, renaming, and listing your environments.

For many people, `envy` might be part of a minimal solution for Python version,
environment, and package management; this is usually done with much bulkier
tools like `conda` or `pyenv + pyenv-virtualenvwrapper`.

## Why?
Python has [a wonderful module](https://docs.python.org/3/library/venv.html) in
its standard library called `venv`.

`venv` is great at what it does; that is: "create virtual environments to
isolate the packages for your various projects from one another."

That being said, `venv` isn't an environment *manager*, nor does it claim to
be. It doesn't copy, remove, rename, or list envs, the kind of stuff most
normal folks need to do with their environments from time to time. Heck, it
doesn't even provide a facility for activating the virtual environments it
creates.

This is where `envy` comes in. A dead-simple way to manage your venvs,
providing just the utilities that people use most.

## Why not `virtualenvwrapper`?
[`virtualenvwrapper`](https://virtualenvwrapper.readthedocs.io/en/latest/)
is another Python virtual environment wrapper that is very good at what it
does... perhaps too good. `virtualenvwrapper` provides facilities for not only
the most common venv operations, but also for managing venvs automatically via
hooks that interact with git, tab completion, etc.

If you have a use for that stuff, please go use this excellent tool.

But if you're like most people, you don't need 1000 lines of code to make,
copy, rename, or list your venvs. You want soemthing dead simple; a minimal
library you can source into your shell and be off to the races.  That's `envy`.

## How?
As a couple of shell functions, environment variables, and aliases, `envy`
isn't installed, per-se.  Simply clone this repo, and source it in your shell's
config file (`.bashrc`, `.zshrc`, or symlink it in `.oh-my-zsh/custom/`, etc.).
For example:

    $ cd <where-you-want-envy-to-live>
    $ clone https://github.com/BrennanBarker/envy.git
    ### open your shell's config file in an editor and add: ###
    source <where-you-want-envy-to-live>/envy/envy.sh

`envy` expects that you'll have some other way of managing Python versions,
whether that's building Python from source (try it, it's fun!), using a version
manager like `pyenv`, or starting from your system's Python.  To create an
environment, call `envy make` with the name of your new venv, and optionally a
Python version found somewhere on your system path.

    $ envy make my-new-venv python3.8

Envy will create a new venv based on your (3.3+) version of Python, and upgrade
complete with a freshly upgraded pip and setuptools packages so you're ready to
install anything else that's needed (via `pip`) after activating your
environment.

    $ activate <my-new-venv>  # Notice this doesn't start with "envy"!
    (my-new-venv) $ pip install <any> <packages> <you> <need>

`envy` puts all venvs in a single folder, by default `~/code/envs`. You can
change this by editing the value of `ENVS` in the `envy.sh` script.  In fact,
I encourage you to take a look at the script and change anything you want; it's
only a couple dozen lines of code!
