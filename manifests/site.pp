

#import 'classes/*.pp'
import 'nodes/*.pp'

yumrepo { 'local':
  baseurl     => 'file:///vagrant/repo/',
  descr     => 'Local Consul Repo ',
  enabled => '1',
}






