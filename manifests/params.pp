# Default parameters
class shutdown_overnight::params {

  $ensure              = 'present'
  $wakeup_hour         = '9'
  $wakeup_minute       = '0'
  $shutdown_hour       = '23'
  $shutdown_minute     = '15'
  $shutdown_message    = 'This computer is shutting down for the night.  Please save your work.'
  $shutdown_delay      = '5'
  $do_auto_wake        = true
  $do_security_updates = false
  $security_logfile    = '/var/log/apt/shutdown-overnight-security-updates.log'
  $wake_monday         = true
  $wake_tuesday        = true
  $wake_wednesday      = true
  $wake_thursday       = true
  $wake_friday         = true
  $wake_saturday       = false
  $wake_sunday         = false

  if $::osfamily == 'RedHat' {
    $notify_package = 'libnotify'
  } elsif $::osfamily == 'Debian' {
    $notify_package = 'libnotify-bin'
  }

}
