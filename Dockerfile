FROM python:3.7-alpine3.7

ADD . /code

WORKDIR /code

RUN \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python", "app.py"]
