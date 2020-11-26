FROM python:3.8-buster
LABEL maintainer="morgan.curley@gmail.com"
LABEL version="<version>"

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y vim bash git

RUN pip install --upgrade pip
RUN pip install dephell[full]

COPY common/entrypoint.sh ./dephell/image_init.* /
COPY common/entrypoint.sh /entrypoint.sh
RUN chmod ugo+x /entrypoint.sh

# This is formatted like this so if `.dephell/startup` does not exist
# the docker build will not fail
COPY ./dephell/README.md ./dephell/startup/* /entrypoint/

# Docker compose can override this by mounting a volume
# here which is what is done for development
COPY ./dephell /repo

WORKDIR /repo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash", "/image_init.sh"]
