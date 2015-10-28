# == Class carbon_relay_ng::install
#
# This class is called from carbon_relay_ng for install.
#
class carbon_relay_ng::install {

  package { $::carbon_relay_ng::package_name:
    ensure => present,
  }
}
