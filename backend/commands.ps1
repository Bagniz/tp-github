# Build image
docker build . -t tp-back

# Run hello world class
docker run --name tp-back-container tp-back

# Run simple api
docker run --name tp-back-container -p "8080:8080" -d tp-back

# Run simple api with datbase
docker run `
    --name tp-back-container `
    --network app-network `
    -p "8080:8080" `
    -d `
    tp-back

# Remove image and container
docker image rm tp-back
docker container rm -f tp-back-container