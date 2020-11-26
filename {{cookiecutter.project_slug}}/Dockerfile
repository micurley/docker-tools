FROM python:3.8-buster
LABEL maintainer="{{ cookiecutter.email }}"
LABEL version="<version>"

RUN apt-get update -y && \
  apt-get upgrade -y

RUN pip install --upgrade pip
RUN pip install poetry

ADD common/entrypoint.sh ./
ADD entrypoint.sh ./

COPY pyproject.toml poetry.* ./

# This is formatted like this so if `.{{ cookiecutter.project_slug }}/startup` does not exist
# the docker build will not fail
COPY ./{{ cookiecutter.project_slug }}/README.md ./{{ cookiecutter.project_slug }}/startup/* /entrypoint/

# Docker compose can override this by mounting a volume
# here which is what is done for development
COPY ./{{ cookiecutter.project_slug }} /repo

WORKDIR /repo

ENTRYPOINT ['/bin/bash', "/entrypoint.sh"]
CMD ['/bin/bash', 'init.sh']
