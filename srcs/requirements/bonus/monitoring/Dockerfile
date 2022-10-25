FROM    python:3.7

RUN     /usr/local/bin/python -m pip install --upgrade pip
COPY    ./tools/monitoring.py /
COPY    conf/requirements.txt .
RUN     pip install --no-cache-dir -r requirements.txt

EXPOSE  80

CMD     ["python", "/monitoring.py"]
