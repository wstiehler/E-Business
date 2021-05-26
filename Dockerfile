# Imagem base oficial 
FROM python:3.9.5-slim-buster

# variaveis de ambient
ENV PYTHONDOWNTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set diretorio de trabalho
ADD . /

WORKDIR /

#install depedencias
RUN pip install poetry

COPY poetry.lock pyproject.toml ./

RUN poetry export -f requirements.txt --output requirements.txt

RUN pip install -r requirements.txt
