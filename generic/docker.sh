docker-clean() {
    docker rm `docker ps --no-trunc -aq`
    docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi
}

docker-kill-all() {
    echo "Killing: `docker ps -q --no-trunc`"
    docker kill `docker ps -q --no-trunc`
    killall -9 bash
    killall -9 fswatch
}

docker-volume-clean() {
    docker volume rm $(docker volume ls -qf dangling=true)
}

docker-shell() {
    docker run --rm -it $1 /bin/sh
}

docker-attach() {
    docker exec -it $1 /bin/bash
}

dct() {
    docker-compose -f docker-composes.test.yml $@
}

docker-stats() {
    docker stats $(docker ps --format '{{.Names}}')
}

alias dc='docker-compose'
alias d='docker'
alias dka='docker-kill-all'
