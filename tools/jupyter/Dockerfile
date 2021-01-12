FROM python:3.8-buster
LABEL maintainer="morgan.curley@gmail.com"
LABEL version="<version>"

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y vim bash git

RUN pip install --upgrade pip \
  && pip install poetry pipenv jupyter jupyterlab

# Add a basic jupyter config
COPY ./jupyter/conf /root/.jupyter

COPY common/entrypoint.sh ./jupyter/image_init.* /
RUN chmod ugo+x /entrypoint.sh

# This is formatted like this so if `.jupyter/startup` does not exist
# the docker build will not fail
COPY ./jupyter/README.md ./jupyter/startup/* /entrypoint/

# Docker compose can override this by mounting a volume
# here which is what is done for development
COPY ./jupyter /repo

WORKDIR /repo

# RUN poetry config virtualenvs.create false && poetry install

EXPOSE 8888

VOLUME [ "/workdir" ]

ENV PYTHONPATH=/repo/src

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["/bin/bash", "/image_init.sh"]
