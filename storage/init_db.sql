CREATE TABLE IF NOT EXISTS ticks (
    id SERIAL PRIMARY KEY,
    symbol TEXT,
    timestamp TIMESTAMPTZ,
    price DOUBLE PRECISION,
    volume DOUBLE PRECISION
);

CREATE INDEX ON ticks (symbol, timestamp);