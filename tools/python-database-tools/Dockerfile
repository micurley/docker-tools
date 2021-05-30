FROM morgancurleykh/python3.8-focal
LABEL maintainer="morgan.curley@gmail.com"
LABEL version="<version>"

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y vim bash git fish zsh

RUN pip install --upgrade pip
RUN pip install poetry

COPY common/entrypoint.sh ./python-database-tools/image_init.* /
RUN chmod ugo+x /entrypoint.sh

# This is formatted like this so if `.python-database-tools/startup` does not exist
# the docker build will not fail
COPY ./python-database-tools/README.md ./python-database-tools/startup/* /entrypoint/

# Docker compose can override this by mounting a volume
# here which is what is done for development
COPY ./python-database-tools /repo

WORKDIR /repo

RUN poetry config virtualenvs.create false && poetry install

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash", "image_init.sh"]
