"""Python REPL history configuration."""
import atexit
import os
import readline
import time
from pathlib import Path


def get_histfile_path():
    xdg_cache_home = os.getenv('XDG_CACHE_HOME')
    if xdg_cache_home:
        histfile = Path(xdg_cache_home) / 'python' / 'history'
    else:
        histfile = Path.home() / '.python_history'

    return histfile


HISTFILE = get_histfile_path()
try:
    readline.read_history_file(str(HISTFILE))
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(1000)
except FileNotFoundError:
    pass

# prevent default use of ~/.python_history
# https://unix.stackexchange.com/questions/121377/how-can-i-disable-the-new-history-feature-in-python-3-4
readline.add_history("# " + time.asctime())

if not HISTFILE.parent.exists():
    HISTFILE.parent.mkdir(parents=True)

atexit.register(readline.write_history_file, str(HISTFILE))
