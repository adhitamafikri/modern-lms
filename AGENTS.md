# AGENTS.md
This is a modern LMS (Learning Management System) platform where students can register and begin to learn

## What you need to know
### Project Directories
Look into the **./playgrounds** to see our projects that make this product possible
- **./playgrounds/platform**: This is the frontend project that serves students of our product
- **./playgrounds/admin-dashboard**: This is the frontend project that serves as admin dashboard of our system.
- **./playgrounds/api**: The backend service that serves both platform and admin dashboard. Written in modular-monolith style.

### Tech Stacks
- **./playgrounds/platform**: React 19 + NextJS 16 with App Router + Tanstack React Query
- **./playgrounds/admin-dashboard**: React 19 + Typescript + React Router v7 + Tanstack Query + Zustand
- **./playgrounds/api**: Go with Gin Gonic + GORM + Auth (JWT access and refresh token)
