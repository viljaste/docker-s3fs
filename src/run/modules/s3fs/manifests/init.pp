class s3fs {
  exec { "s3fs $bucket /s3fs/data":
    path => ['/usr/bin']
  }
}
