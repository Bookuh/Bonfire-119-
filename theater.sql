CREATE TABLE IF NOT EXISTS customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(150),
);

CREATE TABLE IF NOT EXISTS tickets(
    ticket_id SERIAL PRIMARY KEY,
    sub_total INTEGER
);

CREATE TABLE IF NOT EXISTS movies(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(150),
    genre VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS concession(
    order_id SERIAL PRIMARY KEY,
    oder_date DATE DEFAULT CURRENT_DATE,
    sub_total NUMERIC(8,2)
    );