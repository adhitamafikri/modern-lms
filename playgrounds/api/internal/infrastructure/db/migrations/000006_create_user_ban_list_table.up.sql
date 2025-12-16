CREATE TABLE IF NOT EXISTS user_ban_list (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    reason TEXT,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    revoked_at TIMESTAMP
);
