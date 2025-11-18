# The Modern LMS
This project is a e2e modern LMS solution which is inspired by Udemy, but slightly differs from it.
You might have known that Udemy system allows the contributors/teachers to supply the course content. In this project the courses, modules, and lessons would be managed and provisioned by the admin. So expect to have only 2 kind of users here

## Project Outline
### Admin
This is the admin-facing site, managing user data and courses, along with its modules and lessons

### Platform
This is the student-facing site, where users could browse, enroll, and learn the lessons from the enrolled courses

### Backend
The backend of this project, a modular monolith built with ElysiaJS capable of handling student and admin requests

## Tech Stacks
### Admin
- **bun 1.2.23**
- **@tanstack/react-query**: Managing async actions and states, caching, autorefetch
- **React 19**
- **Typescript**
- **React Router v6**: Routing library
- **Zustand**: State management
- **React Hook Form**: Handling form behaviors
- **Zod**: Schema validation + form validation

### Platform
- **bun 1.2.23**
- **@tanstack/react-query**: Managing async actions and states, caching, autorefetch
- **React 19**
- **Typescript**
- **Zustand**: State management
- **React Hook Form**: Handling form behaviors
- **Zod**: Schema validation + form validation

### Backend
- **bun 1.2.23**
- **ElysiaJS**: Backend server
- **pg/drizzle**: Minimal interface to work with PostgreSQL
- **Postgres 7**: Primary Database, Relational Data
- **Redis**: Caching, rate limiting, queue
- **JWT Auth**: Access and Refresh token based auth, single session
- **Zod**: Schema validation (request and response schema validation)
- **Cloudflare R2**: Object storage (media, image, video, sounds, blobs)

### DevOps
- **Docker**
- **Docker Compose**
- **Github Actions**

### Repo Management
- **moonrepo**
- **prototools**
