#!/bin/bash

# plese modify install_dir, pydir if necessary
readonly install_dir="/home/"${USER}"/local"

readonly pydir="/home/"${USER}"/local/python/3.6.8-main"
readonly pybindir="${pydir}/bin"
readonly pylibdir="${pydir}/lib"
readonly pyconfdir="${pylibdir}/python3.6/config-3.6m-x86_64-linux-gnu"

for d in "$install_dir" "$pydir" "$pybindir" "$pylibdir" "$pyconfdir"; do
    if [[ ! -e "$d" ]]; then
        echo "$d not found"
        exit 1
    fi
done

# configure
PATH="${pybindir}:$PATH" \
      LDFLAGS="-L${pylibdir} -Xlinker -export-dynamic" \
      ./configure --prefix="$install_dir" \
      --enable-fail-if-missing \
      --enable-python3interp=yes \
      --with-python3-config-dir="$pyconfdir"

# % make
# % make install

# For deoplete, some python modules are required
# % pip install pynvim
# % pip install jedi
# https://github.com/Shougo/deoplete.nvim#requirements

# Install plugins
# Invoke vim
# :PlugInstall
