$packages = [ 'php', 'php-mysqlnd', 'apache2' ]

package { $packages: 
  ensure => installed,
}

service { apache2:
  ensure => running,
  enable => true,
}

file { '/var/www/html/index.php':
  ensure => present,
  source => "/vagrant/app/web/index.php",
}

file { '/var/www/html/bulgaria-map.png':
  ensure => present,
  source => "/vagrant/app/web/bulgaria-map.png",
}

# Deleting the default index.html from apache and restarting apache2 service.
file { '/var/www/html/index.html':
  ensure => 'absent',
  notify  => Service['apache2'],
}
