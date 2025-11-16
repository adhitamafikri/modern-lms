# The Modern LMS
This project is a e2e modern LMS solution which is inspired by Udemy, but slightly differs from it.
You might have known that Udemy system allows the contributors/teachers to supply the course content. In this project the courses, modules, and lessons would be managed and provisioned by the admin. So expect to have only 2 kind of users here

## Project Outline
### Admin
This is the admin-facing site, managing user data and courses, along with its modules and lessons

### Platform
This is the student-facing site, where users could browse, enroll, and learn the lessons from the enrolled courses

### API
The backend of this project, a modular monolith built with ElysiaJS capable of handling student and admin requests

## Tech Stacks
### Admin
- bun 1.2.23
- @tanstack/react-query
- React 19
- Typescript
- React Router v6
- Zustand

### Platform
- bun 1.2.23
- @tanstack/react-query
- React 19
- Typescript
- Zustand

### API
- bun 1.2.23
- ElysiaJS
- pg/drizzle
- Postgres 7
- Redis
- JWT Auth | Single Session
- Cloudflare R2

### DevOps
- Docker
- Docker Compose
- Github Actions
