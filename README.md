# shutdown_overnight

#### Table of Contents

1. [Overview](#overview)
2. [Parameters](#parameters)
3. [Limitations](#limitations)
4. [Release Notes](#release-notes)

## Overview

This module sets the machine to shutdown at night time and to optionally reboot in the morning.

It can be configured to do security updates before it shuts down and the shutdown and wake times can 
be adjusted.

## Parameters

ensure
------

Defines if shutdown_overnight and its relevant content are to be installed or removed.

Accepts: 'present', 'absent'
Default: 'present'

wakeup_hour
-----------

Defines the hour that the machine should wake up, if $do_auto_wake is
true.

Accepts: 0-23
Default: '9'

wakeup_minute
-------------

Defines the minute that the machine should wake up, if $do_auto_wake is
true.

Accepts: 0-59
Default: '0'

shutdown_hour
-------------

Defines the hour that the machine should shutdown.

Accepts: 0-23
Default: '23'

shutdown_minute
---------------

Defines the minute that the machine should shutdown.

Accepts: 0-59
Default: '15'

shutdown_message
----------------

Defines the message that should be displayed to the user when the machine
is preparing to shutdown.

Accepts: String
Default: 'This computer is shutting down for the night.  Please save
your work.'

shutdown_delay
--------------

Defines the delay before the machine shuts down, in minutes, once the
shutdown time has been reached.

Accepts: 0-30
Default: '5'

do_auto_wake
------------

Defines if the machine should automatically wake in the morning or not.

Accepts: Boolean
Default: true

do_security_updates
-------------------

Defines if the machine should check for an run security updates before
shutting down.

Accepts: Boolean
Default: false

security_logfile
----------------

Defines the path for the logfile for security updates to be placed in.

Accepts: String
Default: '/var/log/apt/shutdown-overnight-security-updates.log'

wake_monday, wake_tuesday, wake_wednesday, etc, 
-----------

Defines if the machine should wake on a Monday, Tuesday, Wednesday, etc.
This does not overide do_auto_wake - if that is false, the machine will
not wake.

Accepts: Boolean
Default: 
wake_monday   - wake_friday = true
wake_saturday - wake_sunday = false

## Limitations

Tested on Ubuntu 14.04 64bit/32bit;
Should work on RHEL.

## Release Notes/Contributors/Etc 

0.1.0 - Initial Release 
