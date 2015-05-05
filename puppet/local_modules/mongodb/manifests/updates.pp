# Installs mongodb
# 2014 3E Enterprises, LLC

class mongodb::updates {
  require repos

  # We must run apt-get update before we install our
  # package because we installed some repo's
  exec { 'apt-update':
    command => '/usr/bin/apt-get update -y -q',
    timeout => 0
  }
}
