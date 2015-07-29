


class profile_nginx {


  include consul_template

  consul_template::template {'nginx':
    source      => '/etc/consul-template/nginx.conf.ctmpl',
    destination => '/etc/nginx/sites-available/consuls.conf',
    command     => '/etc/init.d/nginx restart',
  }


  include nginx

  nginx::site { 'http.consul.az16.be':
    ensure      => present,
    listen      => '80',
    server_name => $listen_domain,
    locations           => [
      {
        '/'                      => {
          'proxy_pass'           => "http://consuls/",
          'proxy_set_header'     => 'Host $host',
          'client_max_body_size' => '450m',

        }
      }
    ],
  }


  file { '/etc/consul-template/nginx.conf.ctmpl':
    ensure => 'file',
    source => 'puppet:///modules/profile_nginx/nginx.conf.ctmpl',
    group  => '0',
    mode   => '644',
    owner  => '0',
  }


}


