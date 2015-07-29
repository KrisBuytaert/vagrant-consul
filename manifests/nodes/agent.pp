

node /agent/ {
  class { 'epel': }

  class { 'apache': }

  package {'nagios-plugins-http': ensure => present; }


  consul::service {'apache':
    tags           => ["apache"],
    check_script   => '/usr/lib64/nagios/plugins/check_http -H localhost -w 2 -c 5',
    check_interval => '10s',
  }


  class { 'consul':
    install_method => 'package',
    config_hash    => {
      'datacenter' => 'vagrant0',
      'data_dir'   => '/var/lib/consul',
      'log_level'  => 'info',
      'node_name'  => $::hostname,
      'bind_addr'  => $::ipaddress_eth1,
      'start_join' => ['192.168.99.111'],
      'server'     => false,
      'domain'     => 'prod.inuits.eu',
    }
  }







}
