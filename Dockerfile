FROM python:3.10.0

WORKDIR /home/

RUN echo "For removing docker caching"

RUN git clone https://github.com/EasyCoding-7/django-basic-example.git

WORKDIR /home/django-basic-example/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=django-insecure-z+6ry2y*usa_5n3c7)h&26$j-)@7j+iu!odo(nx=ts-h@o&oip" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy --bind 0.0.0.0:8000"]