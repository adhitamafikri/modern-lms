# System Design
This document consists of system design decisions for this app

## Functional Requirements
### Admin
**User Management**
- CRUD user
- Ban user

**Course Management**
- Course Categories Management
- Courses Management
- Modules Management
- Lessons Management

**Enrollments Management**
TBD

**Reporting and Insights**
TBD

### Platform/Student
**Course List**
- User could see the list of course categories
- User could see and browse the list of course (search by title, slug, category)

**Course Details**
- User could see the details and overview of a course (title, description, number of modules & lessons, enrolled students)
- User is able to sneak peek on the course's modules and lessons before deciding to enroll
- User could see the overall progress on the course, only if they are enrolled

**Learn Lesson**
- User could navigate between modules and lessons in the course
- User could watch the video, listen to audio of the currently selected lesson.
- User could finish a lesson and proceed to the next by clicking "Next Lesson" CTA
- The course overall progress would be calculated by aggregating each module progress

**My Courses**
- Provide list of courses enrolled by the user
- It should also display the progress of each

### Auth
- Access and Refresh token based auth with JWT
- Single session (_can only be logged in to one device at a time_)

### Backend
- Modular Monolith

## Non Functional Requirements
TBD

## Database Design
Refer to [ERD](./erd.dbml.md). Copy and paste the code to [dbdiagram.io](dbdiagram.io)

(in progress)
