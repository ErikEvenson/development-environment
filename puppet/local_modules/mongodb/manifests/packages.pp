# Installs mongodb
# 2014 3E Enterprises, LLC

class mongodb::packages {
  require updates

  package {
    'mongodb-org':
      ensure => '3.0.3',
  }
}
