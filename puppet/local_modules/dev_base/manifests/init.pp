# Installs development base.
# 2012-2015 Van Brunt and Associates and 3E Enterprises, LLC

class dev_base {
  include 'google_chrome'

  # Install nodejs.
  class { 'nodejs':
    target_dir => '/bin',
    version    => 'v0.12.2',
  }

  require mongodb

  # Install apt-get packages.
  Package {ensure => installed}
  
  $packages = [
    'firefox',
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
  #package { 'bcrypt':
  #  ensure   => '0.8.3',
  #  notify   => Package['npm'],
  #  provider => 'npm',
  #  require  => Class['nodejs'],
  #}

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

  package { 'jwt-simple':
    ensure   => '0.3.0',
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

  package { 'nodemon':
    ensure   => '1.3.7',
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

  # Allow vagrant user to global install npm packages
  exec { 'chown node directory':
    command => '/bin/chown -R vagrant:vagrant /usr/local/node/',
    path    => '/bin',
    require => Package['npm'],
    user    => 'root',
  }

  # Add node path
  file_line {'node_path':
    path => '/etc/environment',
    line => 'NODE_PATH="/usr/local/node/node-default/lib/node_modules"',
  }
}