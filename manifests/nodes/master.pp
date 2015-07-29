


node /master/ {

  class { 'epel': }

  class { 'consul':
    install_method   => 'package',
    config_hash      => {
      'datacenter'   => 'vagrant0',
      'data_dir'     => '/var/lib/consul',
      'ui_dir'       => '/var/www/consul',
      'client_addr'  => '0.0.0.0',
      'log_level'    => 'info',
      'node_name'    => 'master1',
      'bind_addr'    => '192.168.99.111',
      'cluster_addr' => '192.168.99.111',
      'server'       => true,
      'bootstrap'    => true,
      'domain'       => 'prod.inuits.eu'
    }
  }



  include profile_nginx
}


