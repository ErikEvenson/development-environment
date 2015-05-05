# Installs mongodb
# 2014 3E Enterprises, LLC

class mongodb::services {
  require configure

  service {
    'mongod':
      ensure => running,
      enable => true;
  }
}
