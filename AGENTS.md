---
description: E2E Modern LMS Solution
alwaysApply: true
---

# AGENTS.md
This is the mandatory guideline document for AI Agents

## E2E Modern LMS Solution
- https://github.com/adhitamafikri/modern-lms (public)

## What you need to know
### Project Directories
Here is the list of our services in this project:
- **admin**: `./app/admin`. This is the admin-facing site
- **platform**: `./app/platform`. This is the student-facing site
- **backend**: `./app/backend`. This is backend service that would be consumed by student and admin facing sites

### System Design Decisions
Read the [System Design](./docs/system-design.md) document to understand the end-to-end system design for this project

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
