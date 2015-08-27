# == Class: shutdown_overnight
#
# A module to set a machine to shutdown, optionally do a security update, and reboot the next morning.
#
class shutdown_overnight (
  $ensure                = $shutdown_overnight::params::ensure,
) inherits shutdown_overnight::params {

  validate_re($ensure, '^(present|absent)$',"${ensure} is not allowed for the 'ensure' parameter. Allowed values are 'present' and 'absent'.")

  anchor { 'shutdown_overnight::begin': } ->
  class { '::shutdown_overnight::install': } ->
  anchor { 'shutdown_overnight::end': }

}

