DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'rank') THEN
        CREATE TYPE rank AS ENUM ('junior', 'senior', 'lead');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'polarity') THEN
        CREATE TYPE polarity AS ENUM ('debit', 'credit');
    END IF;
END $$;

CREATE TABLE IF NOT EXISTS officer (
    officer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    type rank NOT NULL
);

CREATE TABLE IF NOT EXISTS record (
    officer_id INT REFERENCES officer (officer_id),
    date_time TIMESTAMP NOT NULL,

    initial_balance_1 INT NOT NULL CHECK (initial_balance_1 >= 0),
    initial_balance_5 INT NOT NULL CHECK (initial_balance_5 >= 0),
    initial_balance_10 INT NOT NULL CHECK (initial_balance_10 >= 0),
    initial_balance_20 INT NOT NULL CHECK (initial_balance_20 >= 0),
    initial_balance_50 INT NOT NULL CHECK (initial_balance_50 >= 0),
    initial_balance_100 INT NOT NULL CHECK (initial_balance_100 >= 0),
    
    difference_1 INT NOT NULL CHECK (difference_1 >= 0),
    difference_5 INT NOT NULL CHECK (difference_5 >= 0),
    difference_10 INT NOT NULL CHECK (difference_10 >= 0),
    difference_20 INT NOT NULL CHECK (difference_20 >= 0),
    difference_50 INT NOT NULL CHECK (difference_50 >= 0),
    difference_100 INT NOT NULL CHECK (difference_100 >= 0),

    type polarity NOT NULL,

    PRIMARY KEY (officer_id, date_time)
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'record' AND indexname = 'record_idx') THEN
        CREATE INDEX record_idx ON record (date_time);
    END IF;
END
$$;

