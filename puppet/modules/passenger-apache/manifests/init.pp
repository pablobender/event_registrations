class passenger-apache {
	include apache

	package { 'librack-ruby1.9.1': 
		ensure => "present",
		require => Package["ruby1.9.3"],
	}

  package { 'passenger':
    ensure => "4.0.37",
    provider => "gem",
    require => Package['librack-ruby1.9.1'],
	}

  package { "build-essential":
    ensure => "installed",
    require => Exec["update"],
  }

  package { 'libcurl4-openssl-dev':
    ensure => "installed",
    require => Exec["update"],
  }

  package { "libssl-dev":
    ensure => "installed",
    require => Exec["update"],
  }

  package { "zlib1g-dev":
    ensure => "installed",
    require => Exec["update"],
  }

  exec { "passenger-install-apache2-module":
    command => "passenger-install-apache2-module --auto",
    path => "/usr/local/bin/",
    refreshonly => true,
    require => [
      Package['passenger'], Package['build-essential'], Package['libcurl4-openssl-dev'],
      Package['libssl-dev'], Package['zlib1g-dev'], Package['apache2-prefork-dev'],
      Package['libapr1-dev'], Package['libaprutil1-dev']
    ],
  }

  file { '/etc/apache2/mods-available/passenger.load':
    source => 'puppet:///modules/passenger-apache/passenger.load',
    require => Exec['passenger-install-apache2-module'],
    notify => Service['apache2'],
  }

  file { '/etc/apache2/mods-available/passenger.conf':
    source => 'puppet:///modules/passenger-apache/passenger.conf',
    require => Exec['passenger-install-apache2-module'],
    notify => Service['apache2'],
  }
}