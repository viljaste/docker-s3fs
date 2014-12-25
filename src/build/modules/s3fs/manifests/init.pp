class s3fs {
  require s3fs::packages

  file { '/tmp/s3fs-fuse-1.77.tar.gz':
    ensure => present,
    source => 'puppet:///modules/s3fs/tmp/s3fs-fuse-1.77.tar.gz'
  }

  exec { 'tar xzf s3fs-fuse-1.77.tar.gz':
    cwd => '/tmp',
    path => ['/bin'],
    require => File['/tmp/s3fs-fuse-1.77.tar.gz']
  }

  exec { '/bin/su - root -c "cd /tmp/s3fs-fuse-1.77 && ./autogen.sh"':
    timeout => 0,
    require => Exec['tar xzf s3fs-fuse-1.77.tar.gz']
  }

  exec { '/bin/su - root -c "cd /tmp/s3fs-fuse-1.77 && ./configure --prefix=/usr"':
    timeout => 0,
    require => Exec['/bin/su - root -c "cd /tmp/s3fs-fuse-1.77 && ./autogen.sh"']
  }

  exec { '/bin/su - root -c "cd /tmp/s3fs-fuse-1.77 && make"':
    timeout => 0,
    require => Exec['/bin/su - root -c "cd /tmp/s3fs-fuse-1.77 && ./configure --prefix=/usr"']
  }

  exec { '/bin/su - root -c "cd /tmp/s3fs-fuse-1.77 && make install"':
    timeout => 0,
    require => Exec['/bin/su - root -c "cd /tmp/s3fs-fuse-1.77 && make"']
  }
}
