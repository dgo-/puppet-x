# $Id: $

define x::displaymanager {
  file { '/etc/X11/default-display-manager':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $title;
  }
}
