FROM tiangolo/uwsgi-nginx-flask:python3.8-alpine 
#just an image someone created named tiangolo
RUN apk --update add bash nano
ENV STATIC_URL /static
ENV STATIC_PATH /var/www/app/static
COPY ./requirements.txt /var/www/requirements.txt
RUN pip install -r /var/www/requirements.txt