FROM python:2.7
Maintainer Brian Sang <sang.bri@gmail.com>

RUN pip install Django==1.10.2
RUN pip install argparse==1.2.1
RUN pip install wsgiref==0.1.2

ADD . /myapp
WORKDIR /myapp
RUN pip install -r requirements.txt

EXPOSE 80
CMD python manage.py runserver 0.0.0.0:80
