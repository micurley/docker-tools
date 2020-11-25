#!env bash

CONFIGS=deploy/localhost/docker-compose.yml
if [ -f "deploy/localhost/docker-compose.localhost.yml" ]; then
    CONFIGS="$CONFIGS -f deploy/localhost/docker-compose.localhost.yml"
fi


case "$1" in
  start)
    docker-compose -f $CONFIGS up --build --remove-orphans >dev-server.log 2>&1 &
	;;
  debug)
    docker-compose -f $CONFIGS up --build --remove-orphans
	;;
  stop)
    docker-compose -f $CONFIGS down && \
    find . -name "*.pyc" -delete && \
    find . -name "__pycache__" -delete;
	;;
  shell)
    docker-compose -f $CONFIGS run rbac-flask /bin/bash && \
    find . -name "*.pyc" -delete && \
    find . -name "__pycache__" -delete;
	;;
  nginx)
    docker-compose -f $CONFIGS run rbac-web /bin/bash;
	;;
  build)
    docker build -f deploy/common/Dockerfile.base -t komodohealth/rbac:api-base-latest .
	;;
  config)
    docker-compose -f $CONFIGS config
	;;
  test)
    docker-compose -f deploy/test/docker-compose.yml up --build --remove-orphans
	;;
  stop_test)
    docker-compose -f deploy/test/docker-compose.yml down && \
    find . -name "*.pyc" -delete && \
    find . -name "__pycache__" -delete;
	;;
  logs)
    docker-compose -f $CONFIGS logs --follow
	;;
  *)
	echo "Usage: $SCRIPTNAME {start|debug|stop|shell|build|nginx|config|logs}" >&2
	exit 3
	;;
esac
