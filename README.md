# docker-s3fs

## Run the container

Using the `docker` command:

    CONTAINER="s3fs" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      --cap-add mknod \
      --cap-add sys_admin \
      --device=/dev/fuse \
      -e AWS_ACCESS_KEY_ID="aws access key id" \
      -e AWS_SECRET_ACCESS_KEY="aws secret access key" \
      -e BUCKET="bucket" \
      -d \
      simpledrupalcloud/s3fs
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-s3fs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-s3fs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/s3fs . \
      && cd -

## License

**MIT**
