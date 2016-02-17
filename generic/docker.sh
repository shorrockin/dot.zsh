docker-clean() {
    docker rm `docker ps --no-trunc -aq`
    docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi
}

docker-volume-clean() {
    docker volume rm $(docker volume ls -qf dangling=true)
}

docker-shell() {
    docker run --rm -it $1 /bin/bash
}

docker-attach() {
    docker exec -it $1 /bin/bash
}

dct() {
    docker-compose -f docker-composes.test.yml $@
}

alias dc='docker-compose'
alias d='docker'
