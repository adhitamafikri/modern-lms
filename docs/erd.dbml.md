// Users
Table users {
  id bigint [pk, increment]
  supabase_id varchar [unique, null]
  name varchar [default: '']
  phone varchar [unique, null]
  email varchar [unique, null]
  password varchar [null]
  onboarding_flow_id ulid [null]
  has_completed_onboarding boolean [default: false]
  first_login_at timestamp [null]
  email_verified_at timestamp [null]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (phone)
    (supabase_id)
  }
}


// Onboarding Flows
Table onboarding_flows {
  id ulid [pk]
  title varchar [not null]
  description varchar [null]
  is_active boolean [default: false]
  courses_count int [default: 0]
  students_assigned_count int [default: 0]
  students_completed_count int [default: 0]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]
}

// Onboarding Progress
Table onboarding_progress {
  id bigint [pk, increment]
  user_id bigint [not null]
  onboarding_flow_id ulid [not null]
  status enum('not_started', 'in_progress', 'completed') [default: 'not_started']
  progress_percentage int [default: 0]
  started_at timestamp [null]
  completed_at timestamp [null]
  last_accessed_at timestamp [null]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (user_id, onboarding_flow_id) [unique]
    (user_id, status)
    (onboarding_flow_id, status)
    (status, completed_at)
  }
}

// Courses
Table courses {
  id ulid [pk]
  title varchar [not null]
  slug varchar [unique, not null]
  description text [not null]
  thumbnail_url text [not null]
  enrollment_count int [default: 0]
  modules_count int [default: 0]
  lessons_count int [default: 0]
  duration_seconds int [default: 0]
  is_published boolean [default: false]
  metadata json [null]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (enrollment_count, is_published)
  }
}

// Course Categories
Table course_categories {
  id ulid [pk]
  title varchar [not null]
  slug varchar [not null]
  description text [not null]
  courses_count int [default: 0]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]
}

// Course Modules
Table course_modules {
  id ulid [pk]
  course_id ulid [not null]
  title varchar [not null]
  order int [not null]
  lessons_count int [default: 0]
  duration_seconds int [default: 0]
  is_published boolean [default: true]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (course_id, order)
  }
}

// Course Lessons
Table course_lessons {
  id ulid [pk]
  course_module_id ulid [not null]
  title varchar [not null]
  order int [not null]
  lesson_type varchar [not null]
  lesson_content_url varchar [not null]
  bunny_video_id varchar [null]
  bunny_embed_url varchar [null]
  bunny_hls_url varchar [null]
  bunny_metadata json [null]
  video_source enum('static', 'bunny') [default: 'static']
  duration_seconds int [not null]
  is_published boolean [default: true]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (course_module_id, order)
    (bunny_video_id)
    (video_source)
  }
}

// Enrollments
Table enrollments {
  id bigint [pk, increment]
  user_id bigint [not null]
  course_id ulid [not null]
  status enum('enrolled', 'in_progress', 'completed', 'dropped') [default: 'enrolled']
  progress_percentage int [default: 0]
  enrolled_at timestamp [default: `now()`]
  completed_at timestamp [null]
  last_accessed_at timestamp [null]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (user_id, course_id) [unique]
    (user_id, status)
    (course_id, status)
    (user_id, last_accessed_at)
    (status, enrolled_at)
  }
}

// Module Progress
Table module_progress {
  id bigint [pk, increment]
  user_id bigint [not null]
  course_module_id ulid [not null]
  course_enrollment_id bigint [not null]
  status enum('not_started', 'in_progress', 'completed') [default: 'not_started']
  progress_percentage int [default: 0]
  lessons_completed_count int [default: 0]
  started_at timestamp [null]
  completed_at timestamp [null]
  last_accessed_at timestamp [null]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (user_id, course_module_id) [unique]
    (user_id, course_enrollment_id)
    (course_module_id, status)
    (course_enrollment_id, status)
    (user_id, last_accessed_at)
  }
}

// Lesson Progress
Table lesson_progress {
  id bigint [pk, increment]
  user_id bigint [not null]
  course_lesson_id ulid [not null]
  course_enrollment_id bigint [not null]
  status enum('not_started', 'in_progress', 'completed') [default: 'not_started']
  started_at timestamp [null]
  completed_at timestamp [null]
  time_spent_seconds int [default: 0]
  video_progress_seconds int [default: 0]
  last_accessed_at timestamp [null]
  created_at timestamp [null]
  updated_at timestamp [null]
  deleted_at timestamp [null]

  Indexes {
    (user_id, course_lesson_id) [unique]
    (user_id, course_enrollment_id)
    (course_lesson_id, status)
    (course_enrollment_id, status)
    (user_id, last_accessed_at)
    (user_id, video_progress_seconds)
  }
}

// Pivot table for courses and course_categories
Table course_course_category {
  course_id ulid [pk]
  course_category_id ulid [pk]
  is_primary boolean [default: false]
  created_at timestamp [null]
  updated_at timestamp [null]

  Indexes {
    (course_id, is_primary)
  }
}

// Pivot table for courses and onboarding_flows
Table course_onboarding_flow {
  course_id ulid [pk]
  onboarding_flow_id ulid [pk]
  created_at timestamp [null]
  updated_at timestamp [null]
}

// Permissions
Table permissions {
  id bigint [pk, increment]
  name varchar [not null]
  guard_name varchar [not null]
  created_at timestamp [null]
  updated_at timestamp [null]

  Indexes {
    (name, guard_name) [unique]
  }
}

// Roles
Table roles {
  id bigint [pk, increment]
  team_id bigint [null]
  name varchar [not null]
  guard_name varchar [not null]
  created_at timestamp [null]
  updated_at timestamp [null]

  Indexes {
    (team_id, name, guard_name) [unique]
  }
}

// Model has Permissions
Table model_has_permissions {
  permission_id bigint [pk]
  model_type varchar [pk]
  model_id bigint [pk]
  team_id bigint [pk, null]

  Indexes {
    (model_id, model_type)
    (team_id)
  }
}

// Model has Roles
Table model_has_roles {
  role_id bigint [pk]
  model_type varchar [pk]
  model_id bigint [pk]
  team_id bigint [pk, null]

  Indexes {
    (model_id, model_type)
    (team_id)
  }
}

// Role has Permissions
Table role_has_permissions {
  permission_id bigint [pk]
  role_id bigint [pk]
}

// Personal Access Tokens
Table personal_access_tokens {
  id bigint [pk, increment]
  tokenable_type varchar [not null]
  tokenable_id bigint [not null]
  name text [not null]
  token varchar(64) [unique, not null]
  abilities text [null]
  last_used_at timestamp [null]
  expires_at timestamp [null]
  created_at timestamp [null]
  updated_at timestamp [null]

  Indexes {
    (tokenable_type, tokenable_id)
    (token)
    (expires_at)
  }
}

// Jobs
Table jobs {
  id bigint [pk, increment]
  queue varchar [not null]
  payload longtext [not null]
  attempts tinyint [not null]
  reserved_at int [null]
  available_at int [not null]
  created_at int [not null]

  Indexes {
    (queue)
  }
}

// Sessions
Table sessions {
  id varchar [pk]
  user_id bigint [null]
  ip_address varchar(45) [null]
  user_agent text [null]
  payload longtext [not null]
  last_activity int [not null]

  Indexes {
    (user_id)
    (last_activity)
  }
  
}

// Cache
Table cache {
  key varchar [pk]
  value mediumtext [not null]
  expiration int [not null]
}

// Cache Locks
Table cache_locks {
  key varchar [pk]
  owner varchar [not null]
  expiration int [not null]
}

// Relationships
Ref: users.onboarding_flow_id > onboarding_flows.id
Ref: users.id < enrollments.user_id
Ref: courses.id < enrollments.course_id
Ref: users.id < module_progress.user_id
Ref: course_modules.id < module_progress.course_module_id
Ref: enrollments.id < module_progress.course_enrollment_id
Ref: users.id < lesson_progress.user_id
Ref: course_lessons.id < lesson_progress.course_lesson_id
Ref: enrollments.id < lesson_progress.course_enrollment_id
Ref: courses.id < course_modules.course_id
Ref: course_modules.id < course_lessons.course_module_id
Ref: courses.id < course_course_category.course_id
Ref: course_categories.id < course_course_category.course_category_id
Ref: courses.id < course_onboarding_flow.course_id
Ref: onboarding_flows.id < course_onboarding_flow.onboarding_flow_id
Ref: users.id < onboarding_progress.user_id
Ref: onboarding_flows.id < onboarding_progress.onboarding_flow_id
Ref: permissions.id < model_has_permissions.permission_id
Ref: roles.id < model_has_roles.role_id
Ref: permissions.id < role_has_permissions.permission_id
Ref: roles.id < role_has_permissions.role_id
Ref: users.id < personal_access_tokens.tokenable_id // Morph relationship to users table
Ref: users.id < sessions.user_id
