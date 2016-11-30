FROM continuumio/miniconda3

# Install GCC, needed to pip install uwsgi
RUN apt-get install -y gcc

# Install Python Dependencies (using Conda environment)
COPY environment.yml /tmp/
RUN conda env create -f /tmp/environment.yml

# Overwrite the uWSGI config
COPY uwsgi.ini /etc/uwsgi/

COPY . /src/
WORKDIR /src
EXPOSE 7778

# Ensure "docker_start" is executable
RUN chmod 755 /src/docker_start.sh

ENV DOCKER_CONTAINER="true"

CMD ["/src/docker_start.sh"]