# Installs development base.
# 2012-2015 Van Brunt and Associates and 3E Enterprises, LLC

class dev_base {
  # Install heroku client
  include 'heroku'

  file {'heroku.sh':
    path   => '/etc/profile.d/heroku.sh',
    source => 'puppet:///modules/dev_base/heroku.sh',
  }

  # Install nodejs.
  class { 'nodejs':
    version => 'v0.12.2',
  }

  # Add node path
  file {'nodejs_path.sh':
    path    => '/etc/profile.d/nodejs_path.sh',
    source  => 'puppet:///modules/dev_base/nodejs_path.sh',
  }
  
  require mongodb

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

  # Install global npm packages.  Update npm last.
  package { 'npm':
    ensure   => '2.9.0',
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'npm-check-updates':
    ensure   => '1.5.1',
    notify   => Package['npm'],
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

  # Allow vagrant user to global install npm packages
  exec { 'chown node directory':
    command => '/bin/chown -R vagrant:vagrant /usr/local/node/',
    path    => '/bin',
    require => Package['npm'],
    user    => 'root',
  }
}