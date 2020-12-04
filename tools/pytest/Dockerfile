FROM python:3.8-buster
LABEL maintainer="morgan.curley@komodohealth.com"
LABEL version="<version>"

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y vim bash git pipenv sqlite3

RUN pip install --upgrade pip

# Install testing tools
RUN pip install pytest pytest-testmon pytest-env pytest-watch tdda factory_boy poetry

RUN ln -sf /usr/local/bin/python /bin/python

COPY common/entrypoint.sh ./pytest/image_init.* /
RUN chmod ugo+x /entrypoint.sh

# This is formatted like this so if `.pytest/startup` does not exist
# the docker build will not fail
COPY ./pytest/README.md ./pytest/startup/* /entrypoint/

# Docker compose can override this by mounting a volume
# here which is what is done for development
COPY ./pytest /repo

WORKDIR /repo

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["/bin/bash", "/image_init.sh"]
