# $Id: $

class x::screensaver {

  package { ['xscreensaver', 'xscreensaver-data', 'xscreensaver-data-extra', 'xscreensaver-gl', 'xscreensaver-gl-extra', 'xscreensaver-screensaver-bsod', 'xscreensaver-screensaver-dizzy', 'xscreensaver-screensaver-webcollage' ]:
    ensure => installed,
  }

  file { '/etc/X11/app-defaults/XScreenSaver-nogl':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/x/screensaver/nogl',
    require => Package['xscreensaver', 'xscreensaver-data'];
  }

  file { '/etc/X11/app-defaults/XScreenSaver-gl':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/x/screensaver/gl',
    require => Package['xscreensaver', 'xscreensaver-data'];
  }

  file { '/etc/X11/app-defaults/XScreenSaver':
    ensure => 'link',
    target => '/etc/X11/app-defaults/XScreenSaver-nogl';
  }
}
