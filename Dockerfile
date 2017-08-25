FROM ubuntu:zesty

RUN apt-get update && apt-get install -y \
    git \
    python2.7 \
    python-pip \
    --no-install-recommends

RUN mkdir -p /opt/src/app
WORKDIR /opt/src/app

RUN git clone https://github.com/upenu/django-polls-example.git .

RUN pip install -r requirements.txt
RUN /usr/bin/python2.7 manage.py makemigrations
RUN /usr/bin/python2.7 manage.py migrate

CMD ["/usr/bin/python2.7", "manage.py", "runserver", "0.0.0.0:80"]
