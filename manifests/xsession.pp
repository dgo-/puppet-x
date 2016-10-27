# $Id: $

define x::xsession (
  $ensure = 'present',
) {

  if ($ensure == 'absent') {
    file { "/usr/share/xsessions/${title}.desktop":
      ensure => $ensure;
    }
  } else {
    file { "/usr/share/xsessions/${title}.desktop":
      ensure => $ensure,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => "puppet:///modules/x/xsessions/${title}.desktop";
    }
  }
}
