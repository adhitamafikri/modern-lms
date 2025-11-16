---
description: E2E Modern LMS Solution
alwaysApply: true
---

# AGENTS.md
This is the mandatory guideline document for AI Agents

## E2E Modern LMS Solution
- https://github.com/adhitamafikri/modern-lms (public)

## What you need to know
Here is the list of our services in this project:
- **admin**: `./app/admin`
- **platform**: `./app/platform`
- **api**: `./app/api`

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

### Repo Management
- moonrepo
- prototools
