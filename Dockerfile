FROM python:3.7

# make the 'app' folder the current working directory
WORKDIR /app

# copy git repo
COPY api .
RUN ls
# install project dependencies

RUN pip3 install flask
RUN pip3 install flask-restx
RUN pip3 install mongoengine
RUN pip3 install python-dotenv
RUN pip3 install gunicorn
RUN pip3 install flask-cors


ENV FLASK_APP=API.py
ENV FLASK_ENV=development

EXPOSE 1069
ENTRYPOINT [ "gunicorn", "API:app", "--bind", "0.0.0.0:1069", "--timeout", "120", "--log-level", "debug"]

