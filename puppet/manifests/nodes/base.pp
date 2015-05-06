# Defines the base node.
# 2012-2015 3E Enterprises, LLC

node 'base' {
  include 'dev_base'

  # Run tests.
  exec { 'test_environment':
    command => '/vagrant/scripts/manage.sh test',
    require => Class['dev_base'],
  }
}
