#!/bin/bash
#
# 2012-2015 3E Enterprises, LLC
#
# Inspired by
# http://wiki.bash-hackers.org/commands/classictest

test_environment()
{
  echo "Testing environment..."
  local RETVAL=0

  # Get script directory
  local DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  # Test base.
  source "$DIR/base/test_base.sh"
  test_base

  if [ $? -eq 1 ]; then
    RETVAL=1
  fi

  if [ $RETVAL -eq 0 ]; then
    echo "All environment tests passed."
  fi

  return $RETVAL
}
