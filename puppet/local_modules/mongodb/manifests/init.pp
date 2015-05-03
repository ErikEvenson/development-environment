# Installs mongodb
# 2014 3E Enterprises, LLC
# Adopted from
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
# and
# http://www.snatchfrigate.com/2012/05/24/installing-mongodb-and-zend-server-using-puppet/

class mongodb {   
  class services {
    require configure

    service { 
      'mongod':
        ensure => running,
        enable => true;
    }
  }
   
  class configure {
    require packages
  }
   
  class packages {
    require updates

    package {
      "mongodb-org":
        ensure => "3.0.2",
    }
  }
   
  class updates {
    require repos

    # We must run apt-get update before we install our packaged because we installed some repo's
    exec { "apt-update":
      command => "/usr/bin/apt-get update -y -q",
      timeout => 0
    }
  }
   
  class repos {
    require users

    #lets install some repos
    exec { 
      "get-mongo-key" :
        command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10",
        unless  => "/usr/bin/apt-key list| /bin/grep -c 10gen";
      "install-mongo-repo":
        command => "/bin/echo 'deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list",
        unless  => "/bin/grep 'http://repo.mongodb.org/apt/ubuntu' -c /etc/apt/sources.list";
    }
  }
   
  class users {
  }

  require services
}