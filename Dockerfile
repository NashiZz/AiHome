FROM python:3.9
WORKDIR /ImageDog
COPY ./requirements.txt /ImageDog/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /ImageDog/requirements.txt

COPY ./app /ImageDog/app

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y

ENV PYTHONPATH="${PYTHONPATH}:/ImageDog"

CMD [ "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
