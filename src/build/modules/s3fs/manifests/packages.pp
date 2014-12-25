class s3fs::packages {
  package {[
      'build-essential',
      'libfuse-dev',
      'libcurl4-openssl-dev',
      'libxml2-dev',
      'mime-support',
      'automake',
      'libtool'
    ]:
    ensure => present
  }
}
