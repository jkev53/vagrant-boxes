include git
# install common tools
class install_tools {

  # Install Packages using the old style loop (because puppet < 4.0)

  # one-off defined resource type, in
  # /etc/puppetlabs/code/environments/production/modules/puppet/manifests/binary/symlink.pp
  define puppet::binary::pp ($binary = $title) {
    package { "$binary":
    ensure => 'latest'
  }
}

# TODO: Install pip
# TODO: Module for installing python modules.

# using defined type for iteration, somewhere else in your manifests
$binaries = [ "colordiff",
              "vim",
              "emacs",
              "git",
              "jq",
              "unzip",
              "zip"]

puppet::binary::pp { $binaries: }


}
