DEFAULT_PYTHON=python3.7
ENVS=$HOME/code/envs

activate() { . "$ENVS/$1/bin/activate"; }

envy()
(
    make_env() {
        if [ $# -eq 1 ]; then PY=$DEFAULT_PYTHON; else PY=$2; fi
        echo "creating venv at $ENVS/$1 using $($PY -V)"
        $PY -m venv "$ENVS/$1"
        echo "upgrading pip and setuptools"
        "$ENVS/$1/bin/pip" install --upgrade pip setuptools
    }

    copy_env() {
        make_env "$2" "$ENVS/$1/bin/python"
        echo "Installing packages from $1..."
        "$ENVS/$1/bin/pip" freeze > reqs.txt
        "$ENVS/$2/bin/pip" install -r reqs.txt
        rm reqs.txt
    }

    remove_env() { 
        for env in "$@"; do
            rm -rf "${ENVS:?}/${env:?}"; 
        done
    }

    list_envs() {
        for env in "$ENVS"/*; do
            python_version="$("$env/bin/python" -V)"
            echo "$env ($python_version)"
        done
    }

    list_env_pkgs() { 
        "$ENVS/$1/bin/pip" list | awk '{print $1}' | tail +3 | column 
    }

    move_env() { "copy_env $1 $2"; "remove_env $1"; }

    usage="usage: envy <command> [<args>]
commands:
  -h | help                     Display this message
  mk | make <new> [<python>]    Make <new> venv with <python>, e.g. 'python3.8'
  cp | copy <source> <new>      Copy <source> venv to <new>
  rm | remove <env> [<env>...]  Delete one or more <env>
  ls | list [<env>]             List all envs or the packages within <env>
  mv | rename <old> <new>       Rename <old> venv to <new>
to activate an environment: 
  activate <venv-name>          (Note the lack of 'envy')"
    command=$1; shift 
    case $command in
        "" | "-h" | "help") echo "$usage";;
        "mk" | "make"  ) make_env "$@";;
        "cp" | "copy"  ) copy_env "$@";;
        "rm" | "remove") remove_env "$@";;
        "ls" | "list"  ) 
            if [ $# -eq 0 ]; then list_envs; else list_env_pkgs "$@"; fi;;
        "mv" | "move"  ) move_env "$@";;
        *) 
            echo "envy: '$command' is not an envy command."
            echo "$usage";;
    esac
)
