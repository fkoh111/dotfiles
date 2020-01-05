#!/bin/bash

append() {
  ADD_EXPRESSION=$1
  TARGET=$2  
  echo " "
  echo "Appending expression $ADD_EXPRESSION to $TARGET"

  grep -qxF "$ADD_EXPRESSION" "$TARGET" || echo "$ADD_EXPRESSION" >> "$TARGET"
}