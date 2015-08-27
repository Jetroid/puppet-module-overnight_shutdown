class shutdown_overnight::install (
  $ensure = $shutdown_overnight::ensure,
) {

  # Defaults for the file resource type.
  File{
    owner   => root,
    group   => root,
  }

  # Package used to notify users that we are going to shutdown
  package{"${notify_package}":
    ensure  => $ensure,
  }

  # The script to make is shutdown/restart,etc
  file{'/usr/sbin/shutdown_overnight':
    ensure  => $ensure,
    mode    => "0700",
    source  => 'puppet:///modules/shutdown_overnight/shutdown_overnight',
    require => Package[$notify_package],
  } -> 

  # Cron job to run the script at the correct hours
  file{'/etc/cron.d/shutdown_overnight':
    ensure  => $ensure,
    mode    => "0600",
    content => template('shutdown_overnight/cron.erb'),
  }

  # Rotate the logs so we don't fill up the disk
  file{'/etc/logrotate.d/shutdown_overnight':
    ensure  => $ensure,
    mode    => "0644",
    content => template('shutdown_overnight/logrotate.erb'),
  }

  # Directory to hold the config file
  file{'/etc/shutdown_overnight/':
    ensure  => directory,
    mode    => "0755",
  } ->

  # The config file to tell the shutdown script parameters
  file{'/etc/shutdown_overnight/shutdown_overnight.conf':
    ensure  => $ensure,
    mode    => "0600",
    content => template('shutdown_overnight/shutdown_overnight.conf.erb'),
  }
}
