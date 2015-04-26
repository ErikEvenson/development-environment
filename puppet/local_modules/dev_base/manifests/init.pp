# Installs development base.
# 2012-2015 Van Brunt and Associates and 3E Enterprises, LLC

class dev_base {
  # Install packages.
  Package {ensure => installed}
  
  $packages = [
    # DVCSs
    'git',
    'mercurial',
    'vim',
  ]

  package {$packages:}

  package {'puppet-lint':
    ensure   => installed,
    provider => gem,
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