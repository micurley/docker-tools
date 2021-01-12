FROM morgancurleykh/python3.8-focal
LABEL maintainer="{{ cookiecutter.email }}"
LABEL version="<version>"

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y vim bash git

RUN pip install --upgrade pip
RUN pip install poetry

COPY common/entrypoint.sh ./{{ cookiecutter.project_slug }}/image_init.* /
RUN chmod ugo+x /entrypoint.sh

# This is formatted like this so if `.{{ cookiecutter.project_slug }}/startup` does not exist
# the docker build will not fail
COPY ./{{ cookiecutter.project_slug }}/README.md ./{{ cookiecutter.project_slug }}/startup/* /entrypoint/

# Docker compose can override this by mounting a volume
# here which is what is done for development
COPY ./{{ cookiecutter.project_slug }} /repo

WORKDIR /repo

RUN poetry config virtualenvs.create false && poetry install

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash", "image_init.sh"]
