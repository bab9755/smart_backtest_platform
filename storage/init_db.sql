CREATE TABLE IF NOT EXISTS tick_data (
    id SERIAL PRIMARY KEY,
    symbol TEXT,
    timestamp TIMESTAMPTZ,
    price DOUBLE PRECISION,
    volume DOUBLE PRECISION
);

CREATE INDEX ON tick_data (symbol, timestamp);
