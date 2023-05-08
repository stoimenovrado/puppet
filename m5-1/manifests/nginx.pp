class { 'docker': }

docker::image { 'nginx':
  ensure  => 'latest',
}

docker::run { 'nginx':
  image   => 'nginx',
  ports   => ['80:80'],
}
