# == Class carbon_relay_ng::service
#
# This class is meant to be called from carbon_relay_ng.
# It ensure the service is running.
#
class carbon_relay_ng::service {

  service { $::carbon_relay_ng::service_name:
    ensure     => $carbon_relay_ng::service_ensure,
    enable     => $carbon_relay_ng::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
