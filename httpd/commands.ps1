# Build http image
docker build . -t tp-httpd

# Run container
docker run `
    --name tp-httpd-container `
    --network app-network `
    -p "8081:80" `
    -d `
    tp-httpd

# Get configuration
docker cp tp-httpd-container:/usr/local/apache2/conf/httpd.conf ./default-config.conf

# Remove
docker image rm tp-httpd
docker container rm tp-httpd-container