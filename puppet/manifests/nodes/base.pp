# Defines the base node.
# 2012-2015 3E Enterprises, LLC

node 'base' {
  Package {ensure => installed}
  
  $packages = [
    # DVCSs
    'git',
    'mercurial',
    'vim',
  ]

  package {$packages:}

  exec { '/usr/bin/update-alternatives --set editor /usr/bin/vim.basic':
    require => Package['vim'],
    unless  => '/usr/bin/test /etc/alternatives/editor -ef /usr/bin/vim.basic',
  }

  package {'puppet-lint':
    ensure   => installed,
    provider => gem,
  }

  file_line {'cd_vagrant':
    path => '/home/vagrant/.bashrc',
    line => 'cd /vagrant',
  }

  exec { '/vagrant/scripts/manage.sh test':
  }
}
