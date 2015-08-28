# == Class: shutdown_overnight
#
# A module to set a machine to shutdown, optionally do a security update, and reboot the next morning.
#
class shutdown_overnight (
  $ensure              = $shutdown_overnight::params::ensure,
  $wakeup_hour         = $shutdown_overnight::params::wakeup_hour,
  $wakeup_minute       = $shutdown_overnight::params::wakeup_minute,
  $shutdown_hour       = $shutdown_overnight::params::shutdown_hour,
  $shutdown_minute     = $shutdown_overnight::params::shutdown_minute,
  $shutdown_message    = $shutdown_overnight::params::shutdown_message,
  $shutdown_delay      = $shutdown_overnight::params::shutdown_delay,
  $do_auto_wake        = $shutdown_overnight::params::do_auto_wake,
  $do_security_updates = $shutdown_overnight::params::do_security_updates,
  $security_logfile    = $shutdown_overnight::params::security_logfile,
  $wake_monday         = $shutdown_overnight::params::wake_monday,
  $wake_tuesday        = $shutdown_overnight::params::wake_tuesday,
  $wake_wednesday      = $shutdown_overnight::params::wake_wednesday,
  $wake_thursday       = $shutdown_overnight::params::wake_thursday,
  $wake_friday         = $shutdown_overnight::params::wake_friday,
  $wake_saturday       = $shutdown_overnight::params::wake_saturday,
  $wake_sunday         = $shutdown_overnight::params::wake_sunday,
  $notify_package      = $shutdown_overnight::params::notify_package,
) inherits shutdown_overnight::params {

  validate_re($ensure, '^(present|absent)$',"${ensure} is not allowed for the 'ensure' parameter. Allowed values are 'present' and 'absent'.")
  validate_bool($do_auto_wake,$do_security_updates,$wake_monday,$wake_tuesday,$wake_wednesday,$wake_thursday,$wake_friday,$wake_saturday,$wake_sunday)
  validate_string($wakeup_hour,$wakeup_minute,$shutdown_hour,$shutdown_minute,$shutdown_message,$shutdown_delay,$security_logfile,$notify_package)

  anchor { 'shutdown_overnight::begin': } ->
  class { '::shutdown_overnight::install': } ->
  anchor { 'shutdown_overnight::end': }

}

