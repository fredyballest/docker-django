FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
ADD ./webplayground /code
WORKDIR /code
RUN python manage.py makemigrations --noinput
RUN python manage.py migrate --noinput
#RUN python manage.py test --noinput
EXPOSE 80
CMD python manage.py runserver 0.0.0.0:80
