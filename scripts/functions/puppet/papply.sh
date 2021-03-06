#!/bin/bash
#
# 2012-2015 3E Enterprises, LLC

papply()
{
  echo "Puppet apply..."

  puppet apply /vagrant/puppet/manifests/nodes/base.pp \
    --modulepath=/vagrant/puppet/modules:/vagrant/puppet/local_modules \
    --hiera_config=/vagrant/puppet/hiera.yaml $*

  return
}
