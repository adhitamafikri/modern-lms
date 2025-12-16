CREATE TABLE IF NOT EXISTS course_modules (
    id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    order INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP

    CONSTRAINT fk_course_id
        FOREIGN KEY (course_id)
        REFERENCES courses (id)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);
