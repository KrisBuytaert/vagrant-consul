

node /agent/ {

  class { 'consul':
    install_method => 'package',
    config_hash    => {
      'datacenter' => 'vagrant0',
      'data_dir'   => '/var/lib/consul',
      'log_level'  => 'info',
      'node_name'  => 'agent1',
      'bind_addr'  => '192.168.99.112',
      'start_join'  => ['192.168.99.111'],
      'server'     => false
    }
  }







}


