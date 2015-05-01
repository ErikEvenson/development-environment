# Installs development base.
# 2012-2015 Van Brunt and Associates and 3E Enterprises, LLC

class dev_base {
  # Install nodejs.
  class { 'nodejs':
    version => 'v0.12.2',
  }

  # Install apt-get packages.
  Package {ensure => installed}
  
  $packages = [
    'git',
    'mercurial',
    'vim',
  ]

  package {$packages:}

  # Install gem packages.
  package {'puppet-lint':
    ensure   => '1.1.0',
    provider => gem,
  }

  # Install global npm packages.
  package { 'npm':
    ensure  => '2.9.0',
    provider => 'npm',
    require  => Class['nodejs'],
  }

  # Set vim as editor.
  exec { '/usr/bin/update-alternatives --set editor /usr/bin/vim.basic':
    require => Package['vim'],
    unless  => '/usr/bin/test /etc/alternatives/editor -ef /usr/bin/vim.basic',
  }

  # Set working directory.
  file_line {'cd_vagrant':
    path => '/home/vagrant/.bashrc',
    line => 'cd /vagrant',
  }
}