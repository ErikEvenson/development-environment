# Defines the base node.
# 2012-2015 3E Enterprises, LLC

node 'base' {
  include dev_base

  class { 'nvm_nodejs':
    user    => 'vagrant',
    version => '0.12.2',
    home    => '/home/vagrant',
    require => Class['dev_base'],
  }

  # Run tests.
  exec { 'test_environment':
    command => '/vagrant/scripts/manage.sh test',
    require => Class['dev_base'],
  }
}
