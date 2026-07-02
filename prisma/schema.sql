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
CREATE TABLE "User" (
  "id" TEXT PRIMARY KEY,
  "email" TEXT UNIQUE NOT NULL,
  "passwordHash" TEXT NOT NULL,
  "fullName" TEXT NOT NULL,
  "role" "RoleType" NOT NULL DEFAULT 'EXTERNAL_RESEARCHER',
  "isActive" BOOLEAN DEFAULT true,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Profiles Table
CREATE TABLE "Profile" (
  "id" TEXT PRIMARY KEY,
  "userId" TEXT UNIQUE NOT NULL REFERENCES "User"(id) ON DELETE CASCADE,
  "bio" TEXT,
  "qualification" TEXT,
  "expertise" TEXT,
  "achievements" TEXT,
  "avatar" TEXT,
  "department" TEXT,
  "title" TEXT,
  "linkedIn" TEXT,
  "website" TEXT,
  "location" TEXT,
  "yearsOfExperience" INTEGER,
  "publications" TEXT,
  "researchInterests" TEXT,
  "certifications" TEXT,
  "teamName" TEXT,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE "Product" (
  "id" TEXT PRIMARY KEY,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "category" TEXT,
  "price" DECIMAL(10,2),
  "image" TEXT,
  "features" TEXT,
  "documentation" TEXT,
  "isActive" BOOLEAN DEFAULT true,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Services Table
CREATE TABLE "Service" (
  "id" TEXT PRIMARY KEY,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "category" TEXT,
  "duration" TEXT,
  "price" DECIMAL(10,2),
  "image" TEXT,
  "features" TEXT,
  "isActive" BOOLEAN DEFAULT true,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Blog Posts Table
CREATE TABLE "BlogPost" (
  "id" TEXT PRIMARY KEY,
  "title" TEXT NOT NULL,
  "slug" TEXT UNIQUE NOT NULL,
  "content" TEXT,
  "excerpt" TEXT,
  "coverImage" TEXT,
  "authorId" TEXT REFERENCES "User"(id),
  "authorName" TEXT,
  "tags" TEXT,
  "category" TEXT,
  "published" BOOLEAN DEFAULT false,
  "publishedAt" TIMESTAMP,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Forum Threads Table
CREATE TABLE "ForumThread" (
  "id" TEXT PRIMARY KEY,
  "title" TEXT NOT NULL,
  "content" TEXT NOT NULL,
  "slug" TEXT UNIQUE NOT NULL,
  "authorId" TEXT REFERENCES "User"(id),
  "authorName" TEXT,
  "category" TEXT,
  "tags" TEXT,
  "views" INTEGER DEFAULT 0,
  "replies" INTEGER DEFAULT 0,
  "isPinned" BOOLEAN DEFAULT false,
  "isLocked" BOOLEAN DEFAULT false,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Forum Replies Table
CREATE TABLE "ForumReply" (
  "id" TEXT PRIMARY KEY,
  "threadId" TEXT NOT NULL REFERENCES "ForumThread"(id) ON DELETE CASCADE,
  "content" TEXT NOT NULL,
  "authorId" TEXT REFERENCES "User"(id),
  "authorName" TEXT,
  "isAccepted" BOOLEAN DEFAULT false,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AI Chat Sessions Table
CREATE TABLE "AISession" (
  "id" TEXT PRIMARY KEY,
  "userId" TEXT REFERENCES "User"(id),
  "title" TEXT,
  "context" TEXT,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AI Chat Messages Table
CREATE TABLE "AIMessage" (
  "id" TEXT PRIMARY KEY,
  "sessionId" TEXT NOT NULL REFERENCES "AISession"(id) ON DELETE CASCADE,
  "role" TEXT NOT NULL,
  "content" TEXT NOT NULL,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Newsletter Subscribers Table
CREATE TABLE "NewsletterSubscriber" (
  "id" TEXT PRIMARY KEY,
  "email" TEXT UNIQUE NOT NULL,
  "isActive" BOOLEAN DEFAULT true,
  "subscribedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "unsubscribedAt" TIMESTAMP
);

-- Workspace Projects Table
CREATE TABLE "WorkspaceProject" (
  "id" TEXT PRIMARY KEY,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "ownerId" TEXT REFERENCES "User"(id),
  "status" TEXT,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Workspace Tasks Table
CREATE TABLE "WorkspaceTask" (
  "id" TEXT PRIMARY KEY,
  "projectId" TEXT REFERENCES "WorkspaceProject"(id) ON DELETE CASCADE,
  "title" TEXT NOT NULL,
  "description" TEXT,
  "status" "TaskStatus" DEFAULT 'TODO',
  "priority" "TaskPriority" DEFAULT 'MEDIUM',
  "assigneeId" TEXT REFERENCES "User"(id),
  "assigneeName" TEXT,
  "dueDate" TIMESTAMP,
  "completedAt" TIMESTAMP,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Audit Logs Table
CREATE TABLE "AuditLog" (
  "id" TEXT PRIMARY KEY,
  "action" TEXT NOT NULL,
  "entity" TEXT NOT NULL,
  "entityId" TEXT,
  "userId" TEXT REFERENCES "User"(id),
  "details" TEXT,
  "ipAddress" TEXT,
  "userAgent" TEXT,
  "createdAt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Indexes
CREATE INDEX "User_email_idx" ON "User"(email);
CREATE INDEX "User_role_idx" ON "User"(role);
CREATE INDEX "Profile_userId_idx" ON "Profile"(userId);
CREATE INDEX "BlogPost_authorId_idx" ON "BlogPost"(authorId);
CREATE INDEX "BlogPost_slug_idx" ON "BlogPost"(slug);
CREATE INDEX "ForumThread_authorId_idx" ON "ForumThread"(authorId);
CREATE INDEX "ForumThread_slug_idx" ON "ForumThread"(slug);
CREATE INDEX "ForumReply_threadId_idx" ON "ForumReply"(threadId);
CREATE INDEX "AISession_userId_idx" ON "AISession"(userId);
CREATE INDEX "AIMessage_sessionId_idx" ON "AIMessage"(sessionId);
CREATE INDEX "WorkspaceTask_projectId_idx" ON "WorkspaceTask"(projectId);
CREATE INDEX "WorkspaceTask_assigneeId_idx" ON "WorkspaceTask"(assigneeId);
CREATE INDEX "AuditLog_userId_idx" ON "AuditLog"(userId);
CREATE INDEX "AuditLog_createdAt_idx" ON "AuditLog"(createdAt);
