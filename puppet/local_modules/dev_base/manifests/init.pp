# Installs development base.
# 2012-2015 Van Brunt and Associates and 3E Enterprises, LLC

class dev_base {
  # Install nodejs.
  class { 'nodejs':
    version => 'v0.12.2',
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

  # Install global npm packages.
  package { 'bower':
    ensure   => '1.4.1',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'gulp':
    ensure   => '3.8.11',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'karma-cli':
    ensure   => '0.0.4',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'mocha':
    ensure   => '2.2.4',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

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

  package { 'slush':
    ensure   => '1.1.1',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'slush-generator':
    ensure   => '0.2.6',
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
}