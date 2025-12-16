CREATE TABLE IF NOT EXISTS courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    thumbnail TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
);
