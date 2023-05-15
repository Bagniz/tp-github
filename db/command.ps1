# Create the app network
docker network create app-network

# Create the adminer container
docker run `
    -p "8090:8080" `
    --network app-network `
    --name adminer `
    -d `
    adminer

# Build 'tp-db' image
docker build . -t tp-db

# Run 'tp-db-container' container
docker run `
    --name=tp-db-container `
    --net=app-network `
    --env-file=./.env `
    -v ./data:/var/lib/postgresql/data `
    -d `
    tp-db
