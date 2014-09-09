

node /agent/ {

  class { 'consul':
    install_method => 'package',
    config_hash    => {
      'datacenter' => 'vagrant0',
      'data_dir'   => '/var/lib/consul',
      'log_level'  => 'info',
      'node_name'  => $::hostname,
      'bind_addr'  => $::ipaddress_eth1,
      'start_join'  => ['192.168.99.111'],
      'server'     => false
    }
  }







}


