# == Class carbon_relay_ng::config
#
# This class is called from carbon_relay_ng for service config.
#
class carbon_relay_ng::config {
  $admin_addr          = $::carbon_relay_ng::params::admin_addr
  $admin_port          = $::carbon_relay_ng::params::admin_port
  $bad_metrics_max_age = $::carbon_relay_ng::params::bad_metrics_max_age
  $graphite_addr       = $::carbon_relay_ng::params::graphite_addr
  $graphite_interval   = $::carbon_relay_ng::params::graphite_interval
  $graphite_port       = $::carbon_relay_ng::params::graphite_port
  $http_addr           = $::carbon_relay_ng::params::http_addr
  $http_port           = $::carbon_relay_ng::params::http_port
  $init_config         = $::carbon_relay_ng::params::init_config
  $instance_name       = $::carbon_relay_ng::params::instance_name
  $listen_addr         = $::carbon_relay_ng::params::listen_addr
  $listen_port         = $::carbon_relay_ng::params::listen_port
  $log_level           = $::carbon_relay_ng::params::log_level
  $max_procs           = $::carbon_relay_ng::params::max_procs
  $service_name        = $::carbon_relay_ng::params::service_name
  $spool_dir           = $::carbon_relay_ng::params::spool_dir

  file { ' /var/log/carbon-relay-ng/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  file { '/etc/carbon-relay-ng.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('carbon_relay_ng/carbon-relay-ng.conf.erb'),
    notify  => Service[$service_name],
  }
}
