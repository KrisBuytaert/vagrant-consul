

#import 'classes/*.pp'
import 'nodes/*.pp'

yumrepo { 'local':
  baseurl  => 'file:///vagrant/repo/',
  descr    => 'Local Consul Repo ',
  enabled  => '1',
  gpgcheck => '0',
}


file { '/etc/sudoers.d/10_consul':
  ensure  => 'file',
  content => 'Defaults:consul !requiretty
  consul        ALL=(ALL)       NOPASSWD: ALL
  ',
  group   => '0',
  mode    => '0644',
}





