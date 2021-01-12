FROM ubuntu:latest
LABEL maintainer="morgan.curley@gmail.com"
LABEL version="<version>"

RUN apt update -qy \
  && apt upgrade -qy; \
  ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime; \
  DEBIAN_FRONTEND=noninteractive \
  && apt install -qy software-properties-common \
    vim fish git gdb python3.8-dbg python3-pip wget curl; \
  cd /usr/bin/; \
  ln -s python3.8 python; \
  ln -s pip3 pip; \
  ln -s pydoc3 pydoc; \
  rm -rf /var/lib/apt/lists/*;
#

RUN pip install --upgrade pip \
  && pip install poetry \
  && poetry config virtualenvs.create false

CMD ["python"]
