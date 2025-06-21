FROM python:3.11-slim

WORKDIR /app

#copy all related files withing the current repository
COPY producer.py .


#install dependencies
RUN pip install kafka-python pandas

CMD ["python3", "producer.py"]