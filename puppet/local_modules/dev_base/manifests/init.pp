# Installs development base.
# 2012-2015 Van Brunt and Associates and 3E Enterprises, LLC

class dev_base {
  # Install heroku client
  include 'heroku'

  file {'heroku.sh':
    path    => '/etc/profile.d/heroku.sh',
    source  => 'puppet:///modules/dev_base/heroku.sh',
  }

  # Install nodejs.
  class { 'nodejs':
    version    => 'v0.12.2',
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
    'openjdk-7-jdk',
    'vim',
  ]

  package {$packages:}

  # Install gem packages.
  package {'puppet-lint':
    ensure   => '1.1.0',
    provider => gem,
  }

  # Install global npm packages.  Update npm last.
#  package { 'bcrypt':
#    ensure   => '0.8.3',
#    notify   => Package['npm'],
#    provider => 'npm',
#  }

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

#  package { 'phantomjs':
#    ensure   => '1.9.16',
#    notify   => Package['npm'],
#    provider => 'npm',
#    require  => Class['nodejs'],
#  }

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
}