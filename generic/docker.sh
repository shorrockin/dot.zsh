docker-clean() {
    docker rm `docker ps --no-trunc -aq`
    docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi
}

docker-shell() {
    docker run --rm -it $1 /bin/bash
}
