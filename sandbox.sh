#!/bin/bash

for dot in dots/boilerplates/.*[A-Za-z]; do
  _BOILERPLATE=$(basename $dot)

  if [ -f $HOME/$_BOILERPLATE ]; then
    echo "Seems like there's a boilerplate of $_BOILERPLATE in $HOME"
  else
    echo "Adding a boilerplate of $_BOILERPLATE"
    cp $PWD/dots/boilerplates/$_BOILERPLATE $HOME/$_BOILERPLATE
  fi
done
