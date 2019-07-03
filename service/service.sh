#!/bin/bash
set -ex

(while true; do /usr/games/fortune; sleep 1; done) |
  nc "$VECTOR_HOST" "$VECTOR_PORT"
