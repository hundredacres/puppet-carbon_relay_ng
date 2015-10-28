# == Class carbon_relay_ng::params
#
# This class is meant to be called from carbon_relay_ng.
# It sets variables according to platform.
#
class carbon_relay_ng::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'carbon-relay-ng'
      $service_name = 'carbon-relay-ng'
    }
    'RedHat', 'Amazon': {
      $package_name = 'carbon-relay-ng'
      $service_name = 'carbon-relay-ng'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $admin_addr = '0.0.0.0'
  $admin_port = '2002'
  $bad_metrics_max_age = '24h'
  $graphite_addr = 'localhost'
  $graphite_interval = '10000'
  $graphite_port = '2003'
  $http_addr = '0.0.0.0'
  $http_port = '8081'
  $init_config = undef
  $instance_name = 'default'
  $listen_addr = '0.0.0.0'
  $listen_port = '2003'
  $log_level = 'notice'
  $service_enable = true
  $service_ensure = 'running'
  $spool_dir = '/var/spool/carbon-relay-ng'
}
