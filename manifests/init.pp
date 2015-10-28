# Class: carbon_relay_ng
# ===========================
#
# Full description of class carbon_relay_ng here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class carbon_relay_ng (
  $admin_addr          = $::carbon_relay_ng::params::admin_addr,
  $admin_port          = $::carbon_relay_ng::params::admin_port,
  $bad_metrics_max_age = $::carbon_relay_ng::params::bad_metrics_max_age,
  $graphite_addr       = $::carbon_relay_ng::params::graphite_addr,
  $graphite_interval   = $::carbon_relay_ng::params::graphite_interval,
  $graphite_port       = $::carbon_relay_ng::params::graphite_port,
  $http_addr           = $::carbon_relay_ng::params::http_addr,
  $http_port           = $::carbon_relay_ng::params::http_port,
  $init_config         = $::carbon_relay_ng::params::init_config,
  $instance_name       = $::carbon_relay_ng::params::instance_name,
  $listen_addr         = $::carbon_relay_ng::params::listen_addr,
  $listen_port         = $::carbon_relay_ng::params::listen_port,
  $log_level           = $::carbon_relay_ng::params::log_level,
  $package_name        = $::carbon_relay_ng::params::package_name,
  $service_enable      = $::carbon_relay_ng::params::service_enable,
  $service_ensure      = $::carbon_relay_ng::params::service_ensure,
  $service_name        = $::carbon_relay_ng::params::service_name,
  $spool_dir           = $::carbon_relay_ng::params::spool_dir,
) inherits ::carbon_relay_ng::params {

  # validate parameters here
  if $init_config {
    validate_array($init_config)
  }
  validate_bool($service_enable)

  class { '::carbon_relay_ng::install': } ->
  class { '::carbon_relay_ng::config': } ~>
  class { '::carbon_relay_ng::service': } ->
  Class['::carbon_relay_ng']
}
