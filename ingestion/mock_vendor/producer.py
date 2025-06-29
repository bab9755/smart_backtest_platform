from kafka import KafkaProducer
import pandas as pd
import json
import time
import random
from kafka.errors import NoBrokersAvailable


def create_producer(retries=15, delay=5):
    for i in range(retries):
        try:
            producer = KafkaProducer(
                bootstrap_servers='kafka:9092',
                value_serializer=lambda v: json.dumps(v).encode('utf-8')
            )
            print("Successfully connected to Kafka.")
            return producer
        except NoBrokersAvailable:
            print(f"Kafka not available, retrying in {delay} seconds... (Attempt {i+1}/{retries})")
            time.sleep(delay)
    raise NoBrokersAvailable("Could not connect to Kafka after several retries.")


producer = create_producer()


def generate_mock_tick(symbol):
    price = round(random.uniform(100, 200), 2)
    volume = random.uniform(1, 100)
    return {
        'symbol': symbol,
        'price': price,
        'volume': volume,
        'timestamp': pd.Timestamp.utcnow().isoformat()
    }


def main(): #this is a function to simulate a mock vendor sending data to kafka (this could be yfinance, polygon, etc.)
    while True:
        for symbol in ['AAPL', 'GOOGL', 'MSFT', 'AMZN', 'TSLA']:
            tick = generate_mock_tick(symbol)
            print(tick)
            producer.send('market_data', tick)
            time.sleep(random.uniform(0.5, 1.5))

if __name__ == '__main__':
    main()