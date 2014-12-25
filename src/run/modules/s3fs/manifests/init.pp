class s3fs {
  file { '/etc/passwd-s3fs':
    ensure => present,
    content => template('s3fs/passwd-s3fs'),
    mode => 640
  }

  exec { "s3fs $bucket /s3fs/data -ouse_cache=/tmp":
    path => ['/usr/bin'],
    require => File['/etc/passwd-s3fs']
  }
}
