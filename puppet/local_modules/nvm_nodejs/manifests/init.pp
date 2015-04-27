# Installs nodejs via nvm.
# 2012-2015 3E Enterprises, LLC
# Inspired by
# https://github.com/proletaryo/puppet-nvm_nodejs

class nvm_nodejs (
  $user,
  $version,
  $home = "/home/${user}"
) {
  Exec {
    path => [
       '/usr/local/bin',
       '/usr/bin',
       '/usr/sbin',
       '/bin',
       '/sbin',
    ],
    logoutput => on_failure,
  }

  # NOTE: supports full version numbers (x.x.x) only, otherwise node path will be wrong
  validate_re($version, '^\d+\.\d+\.\d+$',
    'Please specify a valid nodejs version, format: x.x.x (e.g. 0.8.10)')

  # node path and executable
  $NODE_PATH  = "${home}/.nvm/versions/node/v${version}/bin"
  $NODE_EXEC  = "${NODE_PATH}/node"
  $NPM_EXEC   = "${NODE_PATH}/npm"

  # install via script
  exec { 'nvm-install-script':
    command     => 'curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh',
    cwd         => $home,
    user        => $user,
    creates     => "${home}/.nvm/nvm.sh",
    environment => [ "HOME=${home}" ],
    require     => [
        # User[$user],
        Package['git','curl','make']
      ],
  }

  exec { 'nvm-install-node':
    command     => ". ${home}/.nvm/nvm.sh && nvm install ${version} && nvm alias default ${version}",
    cwd         => $home,
    user        => $user,
    unless      => "test -e ${home}/.nvm/versions/node/v${version}/bin/node",
    provider    => shell,
    environment => [ "HOME=${home}", "NVM_DIR=${home}/.nvm" ],
    require     => Exec['nvm-install-script']
  }
}