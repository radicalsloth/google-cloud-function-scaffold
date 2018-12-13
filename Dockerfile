FROM python:latest
MAINTAINER Ryder Damen "ryder@ryderdamen.com"

# Install dev server requirements
COPY ./dev/gcf-requirements.txt /gcf-requirements.txt
RUN pip install -r /gcf-requirements.txt
COPY ./dev/dev-server.py /dev-server.py

# Install cloud function requirements
COPY ./cloud_function/requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

ENTRYPOINT [ "python" ]
CMD [ "/dev-server.py" ]
