FROM python:3.10.0

WORKDIR /home/

RUN git clone https://github.com/EasyCoding-7/django-basic-example.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=django-insecure-z+6ry2y*usa_5n3c7)h&26$j-)@7j+iu!odo(nx=ts-h@o&oip" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]