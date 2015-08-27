# == Class: overnight_shutdown
#
# A module to set a machine to shutdown, optionally do a security update, and reboot the next morning.
#
class overnight_shutdown {
 package{"${notify_package}":
    ensure => $ensure,
  }

}
