FROM python:3.8-buster
LABEL maintainer="morgan.curley@gmail.com"
LABEL version="<version>"

RUN apt-get update -y && \
  apt-get upgrade -y

RUN pip install --upgrade pip
RUN pip install poetry

ADD common/entrypoint.sh ./

COPY ./dephell/pyproject.toml ./dephell/poetry.* ./

# This is formatted like this so if `.dephell/startup` does not exist
# the docker build will not fail
COPY ./dephell/README.md ./dephell/startup/* /entrypoint/

# Docker compose can override this by mounting a volume
# here which is what is done for development
COPY ./dephell /repo

WORKDIR /repo

ENTRYPOINT ['/bin/bash', "/entrypoint.sh"]
CMD ['/bin/bash', 'init.sh']
