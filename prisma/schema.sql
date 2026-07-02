-- InnovaSci AI Labs Database Schema
-- Run this in Supabase SQL Editor

-- Create Enum Types
CREATE TYPE "RoleType" AS ENUM (
  'SYSTEM_ADMINISTRATOR', 'CEO', 'CTO', 'CSO_RESEARCH_DIRECTOR', 'CPO_HEAD_OF_EDTECH',
  'VP_RESEARCH', 'VP_ENGINEERING', 'VP_BUSINESS_DEVELOPMENT', 'FINANCIAL_DIRECTOR',
  'HUMAN_RESOURCES_DIRECTOR', 'HEAD_OF_MARKETING', 'HEAD_OF_LEGAL',
  'PRINCIPAL_AI_RESEARCHER', 'SENIOR_SOFTWARE_ENGINEER', 'JUNIOR_SOFTWARE_DEVELOPER',
  'EDUCATION_SPECIALIST', 'MARKETING_COORDINATOR', 'HR_COORDINATOR',
  'CUSTOMER_SUCCESS_MANAGER', 'SALES_DEVELOPMENT_REP', 'DATA_SCIENTIST', 'EXTERNAL_RESEARCHER'
);

CREATE TYPE "TaskStatus" AS ENUM ('TODO', 'IN_PROGRESS', 'IN_REVIEW', 'DONE');

CREATE TYPE "TaskPriority" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL');

-- Users Table
CREATE TABLE users (
  "id" TEXT PRIMARY KEY,
  "email" TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  full_name TEXT NOT NULL,
  user_role "RoleType" NOT NULL DEFAULT 'EXTERNAL_RESEARCHER',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Profiles Table
CREATE TABLE profiles (
  "id" TEXT PRIMARY KEY,
  user_id TEXT UNIQUE NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  "bio" TEXT,
  "qualification" TEXT,
  "expertise" TEXT,
  "achievements" TEXT,
  "avatar" TEXT,
  "department" TEXT,
  "title" TEXT,
  linked_in TEXT,
  "website" TEXT,
  "location" TEXT,
  "yearsOfExperience" INTEGER,
  "publications" TEXT,
  "researchInterests" TEXT,
  "certifications" TEXT,
  team_name TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE products (
  "id" TEXT PRIMARY KEY,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "category" TEXT,
  "price" DECIMAL(10,2),
  "image" TEXT,
  "features" TEXT,
  "documentation" TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Services Table
CREATE TABLE services (
  "id" TEXT PRIMARY KEY,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "category" TEXT,
  "duration" TEXT,
  "price" DECIMAL(10,2),
  "image" TEXT,
  "features" TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Blog Posts Table
CREATE TABLE blog_posts (
  "id" TEXT PRIMARY KEY,
  "title" TEXT NOT NULL,
  "slug" TEXT UNIQUE NOT NULL,
  "content" TEXT,
  "excerpt" TEXT,
  cover_image TEXT,
  author_id TEXT REFERENCES users(id),
  author_name TEXT,
  "tags" TEXT,
  "category" TEXT,
  "published" BOOLEAN DEFAULT false,
  published_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Forum Threads Table
CREATE TABLE forum_threads (
  "id" TEXT PRIMARY KEY,
  "title" TEXT NOT NULL,
  "content" TEXT NOT NULL,
  "slug" TEXT UNIQUE NOT NULL,
  author_id TEXT REFERENCES users(id),
  author_name TEXT,
  "category" TEXT,
  "tags" TEXT,
  "views" INTEGER DEFAULT 0,
  "replies" INTEGER DEFAULT 0,
  is_pinned BOOLEAN DEFAULT false,
  is_locked BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Forum Replies Table
CREATE TABLE forum_replies (
  "id" TEXT PRIMARY KEY,
  thread_id TEXT NOT NULL REFERENCES forum_threads(id) ON DELETE CASCADE,
  "content" TEXT NOT NULL,
  author_id TEXT REFERENCES users(id),
  author_name TEXT,
  is_accepted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AI Chat Sessions Table
CREATE TABLE ai_sessions (
  "id" TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id),
  "title" TEXT,
  "context" TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AI Chat Messages Table
CREATE TABLE ai_messages (
  "id" TEXT PRIMARY KEY,
  session_id TEXT NOT NULL REFERENCES ai_sessions(id) ON DELETE CASCADE,
  "role" TEXT NOT NULL,
  "content" TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Newsletter Subscribers Table
CREATE TABLE newsletter_subscribers (
  "id" TEXT PRIMARY KEY,
  "email" TEXT UNIQUE NOT NULL,
  is_active BOOLEAN DEFAULT true,
  subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  unsubscribed_at TIMESTAMP
);

-- Workspace Projects Table
CREATE TABLE workspace_projects (
  "id" TEXT PRIMARY KEY,
  "name" TEXT NOT NULL,
  "description" TEXT,
  owner_id TEXT REFERENCES users(id),
  "status" TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Workspace Tasks Table
CREATE TABLE workspace_tasks (
  "id" TEXT PRIMARY KEY,
  project_id TEXT REFERENCES workspace_projects(id) ON DELETE CASCADE,
  "title" TEXT NOT NULL,
  "description" TEXT,
  "status" "TaskStatus" DEFAULT 'TODO',
  "priority" "TaskPriority" DEFAULT 'MEDIUM',
  "assigneeId" TEXT REFERENCES users(id),
  assignee_name TEXT,
  due_date TIMESTAMP,
  completed_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Audit Logs Table
CREATE TABLE audit_logs (
  "id" TEXT PRIMARY KEY,
  "action" TEXT NOT NULL,
  "entity" TEXT NOT NULL,
  entity_id TEXT,
  user_id TEXT REFERENCES users(id),
  "details" TEXT,
  ip_address TEXT,
  user_agent TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Indexes
CREATE INDEX "User_email_idx" ON users(email);
CREATE INDEX "User_role_idx" ON users(user_role);
CREATE INDEX "Profile_user_id_idx" ON profiles(user_id);
CREATE INDEX "BlogPost_author_id_idx" ON blog_posts(author_id);
CREATE INDEX "BlogPost_slug_idx" ON blog_posts(slug);
CREATE INDEX "ForumThread_author_id_idx" ON forum_threads(author_id);
CREATE INDEX "ForumThread_slug_idx" ON forum_threads(slug);
CREATE INDEX "ForumReply_thread_id_idx" ON forum_replies(thread_id);
CREATE INDEX "AISession_user_id_idx" ON ai_sessions(user_id);
CREATE INDEX "AIMessage_session_id_idx" ON ai_messages(session_id);
CREATE INDEX "WorkspaceTask_project_id_idx" ON workspace_tasks(project_id);
CREATE INDEX "WorkspaceTask_assignee_id_idx" ON workspace_tasks(assignee_id);
CREATE INDEX "AuditLog_user_id_idx" ON audit_logs(user_id);
CREATE INDEX "AuditLog_created_at_idx" ON audit_logs(created_at);
