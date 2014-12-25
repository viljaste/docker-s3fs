class s3fs {
  exec { "mkdir -p $mount_point":
    path => ['/bin']
  }

  file { '/etc/passwd-s3fs':
    ensure => present,
    content => template('s3fs/passwd-s3fs'),
    mode => 640,
    require => Exec["mkdir -p $mount_point"]
  }

  exec { "s3fs -o allow_other -ouse_cache=/tmp $bucket $mount_point":
    path => ['/usr/bin'],
    require => File['/etc/passwd-s3fs']
  }
}
