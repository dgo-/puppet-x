# $Id: $

define x::autostart (
  $exec='',
  $terminal=false,
  $hidden=false,
  $type='Application',
  $comment="start ${title}",
  $GNOMEAutostart=true,
  $dir='/etc/xdg/autostart',
  $ensure = 'present',
){
  file { "${dir}/${title}.desktop":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('x/autostart.desktop.erb');
  }
}

