# Installs mongodb
# 2014 3E Enterprises, LLC

class mongodb::repos {
  require users

  #lets install some repos
  exec {
    'get-mongo-key' :
      command => '/usr/bin/apt-key adv --keyserver \
                  keyserver.ubuntu.com --recv 7F0CEB10',

      unless  => '/usr/bin/apt-key list| /bin/grep -c 10gen';
    'install-mongo-repo':
      command => "/bin/echo 'deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list",
      unless  => "/bin/grep 'http://repo.mongodb.org/apt/ubuntu' -c /etc/apt/sources.list";
  }
}
