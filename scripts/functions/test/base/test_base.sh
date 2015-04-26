#!/bin/bash
#
# 2012-2015 3E Enterprises, LLC

test_base()
{
  local RETVAL=0
  local TEST_VALUE

  # Verify git is installed.
  if [ ! -e /usr/bin/git ]; then
    echo "FAIL: git is not installed" >&2
    RETVAL=1
  fi

  # Verify hg is installed.
  if [ ! -e /usr/bin/hg ]; then
    echo "FAIL: mercurial is not installed" >&2
    RETVAL=1
  fi

  # Verify vim is installed and set.
  if [ ! -e /usr/bin/vim ]; then
    echo "FAIL: vim is not installed" >&2
    RETVAL=1
  fi

  local TEST_VALUE=$(update-alternatives --query editor | grep Value)

  if [ "$TEST_VALUE" != "Value: /usr/bin/vim.basic" ]; then
    echo "FAIL: vim is not set as editor" >&2
    RETVAL=1
  fi

  # Verify puppet-lint is installed.
  if [ ! -e /usr/bin/puppet-lint ]; then
    echo "FAIL: puppet-lint is not installed" >&2
    RETVAL=1
  fi

  # Verify cd /vagrant is in profile.
  TEST_VALUE=$(cat /home/vagrant/.bashrc | grep "cd /vagrant")

  if [ "$TEST_VALUE" != "cd /vagrant" ]; then
    echo "FAIL: cd /vagrant not set in .bashrc" >&2
    RETVAL=1
  fi

  return $RETVAL
}
