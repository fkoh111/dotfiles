#!/bin/bash

append() {
  _ADD_EXPRESSION=$1
  _TARGET=$2  
  echo "Appending expression $_ADD_EXPRESSION to $_TARGET"

  grep -qxF "$_ADD_EXPRESSION" "$_TARGET" || echo "$_ADD_EXPRESSION" >> "$_TARGET"
}