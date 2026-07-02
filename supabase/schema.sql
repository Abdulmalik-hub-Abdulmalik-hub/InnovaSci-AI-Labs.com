-- =====================================================
-- InnovaSci AI Labs - Complete Database Schema
-- Supabase PostgreSQL with RLS Policies & Triggers
-- =====================================================

-- =====================================================
-- SECTION 1: DROP EXISTING OBJECTS (for clean reinstall)
-- =====================================================
-- Drop triggers first (they depend on functions)
DROP TRIGGER IF EXISTS audit_users_changes ON users CASCADE;
DROP TRIGGER IF EXISTS audit_profiles_changes ON profiles CASCADE;
DROP TRIGGER IF EXISTS audit_products_changes ON products CASCADE;
DROP TRIGGER IF EXISTS audit_services_changes ON services CASCADE;
DROP TRIGGER IF EXISTS audit_blog_changes ON blog_posts CASCADE;
DROP TRIGGER IF EXISTS audit_forum_changes ON forum_threads CASCADE;
DROP TRIGGER IF EXISTS audit_workspace_changes ON workspace_tasks CASCADE;
DROP TRIGGER IF EXISTS update_users_updated_at ON users CASCADE;
DROP TRIGGER IF EXISTS update_profiles_updated_at ON profiles CASCADE;
DROP TRIGGER IF EXISTS update_products_updated_at ON products CASCADE;
DROP TRIGGER IF EXISTS update_services_updated_at ON services CASCADE;
DROP TRIGGER IF EXISTS update_blog_posts_updated_at ON blog_posts CASCADE;
DROP TRIGGER IF EXISTS update_forum_threads_updated_at ON forum_threads CASCADE;
DROP TRIGGER IF EXISTS update_forum_replies_updated_at ON forum_replies CASCADE;
DROP TRIGGER IF EXISTS update_ai_sessions_updated_at ON ai_sessions CASCADE;
DROP TRIGGER IF EXISTS update_workspace_projects_updated_at ON workspace_projects CASCADE;
DROP TRIGGER IF EXISTS update_workspace_tasks_updated_at ON workspace_tasks CASCADE;

-- Drop functions
DROP FUNCTION IF EXISTS audit_trigger_function() CASCADE;
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;

DROP TABLE IF EXISTS audit_logs CASCADE;
DROP TABLE IF EXISTS workspace_tasks CASCADE;
DROP TABLE IF EXISTS workspace_projects CASCADE;
DROP TABLE IF EXISTS newsletter_subscribers CASCADE;
DROP TABLE IF EXISTS ai_messages CASCADE;
DROP TABLE IF EXISTS ai_sessions CASCADE;
DROP TABLE IF EXISTS forum_replies CASCADE;
DROP TABLE IF EXISTS forum_threads CASCADE;
DROP TABLE IF EXISTS blog_posts CASCADE;
DROP TABLE IF EXISTS services CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;
DROP TABLE IF EXISTS users CASCADE;

DROP TYPE IF EXISTS "RoleType" CASCADE;
DROP TYPE IF EXISTS "TaskStatus" CASCADE;
DROP TYPE IF EXISTS "TaskPriority" CASCADE;

-- =====================================================
-- SECTION 2: CREATE ENUM TYPES
-- =====================================================
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

-- =====================================================
-- SECTION 3: CREATE TABLES
-- =====================================================

-- Users Table
CREATE TABLE users (
  id TEXT PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  full_name TEXT NOT NULL,
  user_role "RoleType" NOT NULL DEFAULT 'EXTERNAL_RESEARCHER',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Profiles Table
CREATE TABLE profiles (
  id TEXT PRIMARY KEY,
  user_id TEXT UNIQUE NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  bio TEXT,
  qualification TEXT,
  expertise TEXT,
  achievements TEXT,
  avatar TEXT,
  department TEXT,
  title TEXT,
  linked_in TEXT,
  website TEXT,
  location TEXT,
  years_of_experience INTEGER,
  publications TEXT,
  research_interests TEXT,
  certifications TEXT,
  team_name TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE products (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  category TEXT,
  price DECIMAL(10,2),
  image TEXT,
  features TEXT,
  documentation TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Services Table
CREATE TABLE services (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  category TEXT,
  duration TEXT,
  price DECIMAL(10,2),
  image TEXT,
  features TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Blog Posts Table
CREATE TABLE blog_posts (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  content TEXT,
  excerpt TEXT,
  cover_image TEXT,
  author_id TEXT REFERENCES users(id),
  author_name TEXT,
  tags TEXT,
  category TEXT,
  published BOOLEAN DEFAULT false,
  published_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Forum Threads Table
CREATE TABLE forum_threads (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  author_id TEXT REFERENCES users(id),
  author_name TEXT,
  category TEXT,
  tags TEXT,
  views INTEGER DEFAULT 0,
  replies INTEGER DEFAULT 0,
  is_pinned BOOLEAN DEFAULT false,
  is_locked BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Forum Replies Table
CREATE TABLE forum_replies (
  id TEXT PRIMARY KEY,
  thread_id TEXT NOT NULL REFERENCES forum_threads(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  author_id TEXT REFERENCES users(id),
  author_name TEXT,
  is_accepted BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- AI Chat Sessions Table
CREATE TABLE ai_sessions (
  id TEXT PRIMARY KEY,
  user_id TEXT REFERENCES users(id),
  title TEXT,
  context TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- AI Chat Messages Table
CREATE TABLE ai_messages (
  id TEXT PRIMARY KEY,
  session_id TEXT NOT NULL REFERENCES ai_sessions(id) ON DELETE CASCADE,
  role TEXT NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Newsletter Subscribers Table
CREATE TABLE newsletter_subscribers (
  id TEXT PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  is_active BOOLEAN DEFAULT true,
  subscribed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  unsubscribed_at TIMESTAMP WITH TIME ZONE
);

-- Workspace Projects Table
CREATE TABLE workspace_projects (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  owner_id TEXT REFERENCES users(id),
  status TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Workspace Tasks Table
CREATE TABLE workspace_tasks (
  id TEXT PRIMARY KEY,
  project_id TEXT REFERENCES workspace_projects(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT,
  status "TaskStatus" DEFAULT 'TODO',
  priority "TaskPriority" DEFAULT 'MEDIUM',
  assignee_id TEXT REFERENCES users(id),
  assignee_name TEXT,
  due_date TIMESTAMP WITH TIME ZONE,
  completed_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Audit Logs Table
CREATE TABLE audit_logs (
  id TEXT PRIMARY KEY,
  action TEXT NOT NULL,
  entity TEXT NOT NULL,
  entity_id TEXT,
  user_id TEXT REFERENCES users(id),
  details JSONB,
  ip_address TEXT,
  user_agent TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- SECTION 4: CREATE INDEXES
-- =====================================================
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(user_role);
CREATE INDEX idx_users_active ON users(is_active);
CREATE INDEX idx_profiles_user_id ON profiles(user_id);
CREATE INDEX idx_blog_posts_author ON blog_posts(author_id);
CREATE INDEX idx_blog_posts_slug ON blog_posts(slug);
CREATE INDEX idx_blog_posts_published ON blog_posts(published);
CREATE INDEX idx_forum_threads_author ON forum_threads(author_id);
CREATE INDEX idx_forum_threads_slug ON forum_threads(slug);
CREATE INDEX idx_forum_threads_category ON forum_threads(category);
CREATE INDEX idx_forum_replies_thread ON forum_replies(thread_id);
CREATE INDEX idx_forum_replies_author ON forum_replies(author_id);
CREATE INDEX idx_ai_sessions_user ON ai_sessions(user_id);
CREATE INDEX idx_ai_messages_session ON ai_messages(session_id);
CREATE INDEX idx_workspace_tasks_project ON workspace_tasks(project_id);
CREATE INDEX idx_workspace_tasks_assignee ON workspace_tasks(assignee_id);
CREATE INDEX idx_workspace_tasks_status ON workspace_tasks(status);
CREATE INDEX idx_audit_logs_user ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_entity ON audit_logs(entity, entity_id);
CREATE INDEX idx_audit_logs_created ON audit_logs(created_at);

-- =====================================================
-- SECTION 5: AUTO-UPDATE TIMESTAMPS
-- =====================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_services_updated_at BEFORE UPDATE ON services
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_blog_posts_updated_at BEFORE UPDATE ON blog_posts
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_forum_threads_updated_at BEFORE UPDATE ON forum_threads
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_forum_replies_updated_at BEFORE UPDATE ON forum_replies
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_ai_sessions_updated_at BEFORE UPDATE ON ai_sessions
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_workspace_projects_updated_at BEFORE UPDATE ON workspace_projects
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_workspace_tasks_updated_at BEFORE UPDATE ON workspace_tasks
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- SECTION 6: AUDIT LOGGING TRIGGER
-- =====================================================
CREATE OR REPLACE FUNCTION audit_trigger_function()
RETURNS TRIGGER AS $$
DECLARE
  audit_action TEXT;
  audit_details JSONB;
  audit_entity TEXT;
  entity_id_val TEXT;
  audit_user_id TEXT;
BEGIN
  audit_entity := TG_TABLE_NAME;
  
  IF TG_OP = 'INSERT' THEN
    audit_action := 'CREATE';
    audit_details := jsonb_build_object('new', to_jsonb(NEW));
    -- Try to get user_id from new row if it exists
    IF NEW IS NOT NULL AND (SELECT count(*) > 0 FROM jsonb_object_keys(NEW) k WHERE k = 'user_id') > 0 THEN
      audit_user_id := NEW.user_id;
    ELSE
      audit_user_id := NULL;
    END IF;
  ELSIF TG_OP = 'UPDATE' THEN
    audit_action := 'UPDATE';
    audit_details := jsonb_build_object('old', to_jsonb(OLD), 'new', to_jsonb(NEW));
    IF NEW IS NOT NULL AND (SELECT count(*) > 0 FROM jsonb_object_keys(NEW) k WHERE k = 'user_id') > 0 THEN
      audit_user_id := NEW.user_id;
    ELSIF OLD IS NOT NULL AND (SELECT count(*) > 0 FROM jsonb_object_keys(OLD) k WHERE k = 'user_id') > 0 THEN
      audit_user_id := OLD.user_id;
    ELSE
      audit_user_id := NULL;
    END IF;
  ELSIF TG_OP = 'DELETE' THEN
    audit_action := 'DELETE';
    audit_details := jsonb_build_object('old', to_jsonb(OLD));
    IF OLD IS NOT NULL AND (SELECT count(*) > 0 FROM jsonb_object_keys(OLD) k WHERE k = 'user_id') > 0 THEN
      audit_user_id := OLD.user_id;
    ELSE
      audit_user_id := NULL;
    END IF;
  END IF;
  
  -- Get entity_id from the primary key column
  IF NEW IS NOT NULL THEN
    EXECUTE 'SELECT ($1.' || TG_ARGV[0] || ')::TEXT' INTO entity_id_val USING NEW;
  ELSIF OLD IS NOT NULL THEN
    EXECUTE 'SELECT ($1.' || TG_ARGV[0] || ')::TEXT' INTO entity_id_val USING OLD;
  END IF;
  
  INSERT INTO audit_logs (id, action, entity, entity_id, user_id, details)
  VALUES (
    gen_random_uuid()::TEXT,
    audit_action,
    audit_entity,
    entity_id_val,
    audit_user_id,
    audit_details
  );
  
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS audit_users_changes ON users;
CREATE TRIGGER audit_users_changes
  AFTER INSERT OR UPDATE OR DELETE ON users
  FOR EACH ROW EXECUTE FUNCTION audit_trigger_function('id');

DROP TRIGGER IF EXISTS audit_profiles_changes ON profiles;
CREATE TRIGGER audit_profiles_changes
  AFTER INSERT OR UPDATE OR DELETE ON profiles
  FOR EACH ROW EXECUTE FUNCTION audit_trigger_function('id');

DROP TRIGGER IF EXISTS audit_products_changes ON products;
CREATE TRIGGER audit_products_changes
  AFTER INSERT OR UPDATE OR DELETE ON products
  FOR EACH ROW EXECUTE FUNCTION audit_trigger_function('id');

DROP TRIGGER IF EXISTS audit_services_changes ON services;
CREATE TRIGGER audit_services_changes
  AFTER INSERT OR UPDATE OR DELETE ON services
  FOR EACH ROW EXECUTE FUNCTION audit_trigger_function('id');

DROP TRIGGER IF EXISTS audit_blog_changes ON blog_posts;
CREATE TRIGGER audit_blog_changes
  AFTER INSERT OR UPDATE OR DELETE ON blog_posts
  FOR EACH ROW EXECUTE FUNCTION audit_trigger_function('id');

DROP TRIGGER IF EXISTS audit_forum_changes ON forum_threads;
CREATE TRIGGER audit_forum_changes
  AFTER INSERT OR UPDATE OR DELETE ON forum_threads
  FOR EACH ROW EXECUTE FUNCTION audit_trigger_function('id');

DROP TRIGGER IF EXISTS audit_workspace_changes ON workspace_tasks;
CREATE TRIGGER audit_workspace_changes
  AFTER INSERT OR UPDATE OR DELETE ON workspace_tasks
  FOR EACH ROW EXECUTE FUNCTION audit_trigger_function('id');

-- =====================================================
-- SECTION 7: HELPER FUNCTIONS (must be before RLS policies)
-- =====================================================
CREATE OR REPLACE FUNCTION get_user_role()
RETURNS TEXT AS $$
BEGIN
  RETURN current_setting('app.current_user_role', true);
EXCEPTION WHEN OTHERS THEN RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION get_current_user_id()
RETURNS TEXT AS $$
BEGIN
  RETURN current_setting('app.current_user_id', true);
EXCEPTION WHEN OTHERS THEN RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN get_user_role() = 'SYSTEM_ADMINISTRATOR';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION is_executive()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN get_user_role() IN ('SYSTEM_ADMINISTRATOR', 'CEO', 'CTO', 'CSO_RESEARCH_DIRECTOR', 'CPO_HEAD_OF_EDTECH', 'VP_RESEARCH', 'VP_ENGINEERING', 'VP_BUSINESS_DEVELOPMENT');
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================
-- SECTION 8: ENABLE ROW LEVEL SECURITY
-- =====================================================
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE services ENABLE ROW LEVEL SECURITY;
ALTER TABLE blog_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE forum_threads ENABLE ROW LEVEL SECURITY;
ALTER TABLE forum_replies ENABLE ROW LEVEL SECURITY;
ALTER TABLE ai_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE ai_messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE newsletter_subscribers ENABLE ROW LEVEL SECURITY;
ALTER TABLE workspace_projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE workspace_tasks ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- SECTION 9: ROW LEVEL SECURITY POLICIES
-- =====================================================

-- USERS RLS
DROP POLICY IF EXISTS users_select_all ON users;
CREATE POLICY users_select_all ON users FOR SELECT USING (true);

DROP POLICY IF EXISTS users_insert_admin ON users;
CREATE POLICY users_insert_admin ON users FOR INSERT WITH CHECK (is_admin() = true);

DROP POLICY IF EXISTS users_update_admin ON users;
CREATE POLICY users_update_admin ON users FOR UPDATE USING (is_admin() = true OR (get_current_user_id() = id));

DROP POLICY IF EXISTS users_delete_admin ON users;
CREATE POLICY users_delete_admin ON users FOR DELETE USING (is_admin() = true);

-- PROFILES RLS
DROP POLICY IF EXISTS profiles_select_all ON profiles;
CREATE POLICY profiles_select_all ON profiles FOR SELECT USING (true);

DROP POLICY IF EXISTS profiles_insert_owner ON profiles;
CREATE POLICY profiles_insert_owner ON profiles FOR INSERT WITH CHECK (user_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS profiles_update_owner ON profiles;
CREATE POLICY profiles_update_owner ON profiles FOR UPDATE USING (user_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS profiles_delete_admin ON profiles;
CREATE POLICY profiles_delete_admin ON profiles FOR DELETE USING (is_admin() = true);

-- PRODUCTS RLS
DROP POLICY IF EXISTS products_select_all ON products;
CREATE POLICY products_select_all ON products FOR SELECT USING (true);

DROP POLICY IF EXISTS products_insert_admin ON products;
CREATE POLICY products_insert_admin ON products FOR INSERT WITH CHECK (is_admin() = true OR is_executive() = true);

DROP POLICY IF EXISTS products_update_admin ON products;
CREATE POLICY products_update_admin ON products FOR UPDATE USING (is_admin() = true OR is_executive() = true);

DROP POLICY IF EXISTS products_delete_admin ON products;
CREATE POLICY products_delete_admin ON products FOR DELETE USING (is_admin() = true);

-- SERVICES RLS
DROP POLICY IF EXISTS services_select_all ON services;
CREATE POLICY services_select_all ON services FOR SELECT USING (true);

DROP POLICY IF EXISTS services_insert_admin ON services;
CREATE POLICY services_insert_admin ON services FOR INSERT WITH CHECK (is_admin() = true OR is_executive() = true);

DROP POLICY IF EXISTS services_update_admin ON services;
CREATE POLICY services_update_admin ON services FOR UPDATE USING (is_admin() = true OR is_executive() = true);

DROP POLICY IF EXISTS services_delete_admin ON services;
CREATE POLICY services_delete_admin ON services FOR DELETE USING (is_admin() = true);

-- BLOG POSTS RLS
DROP POLICY IF EXISTS blog_posts_select_published ON blog_posts;
CREATE POLICY blog_posts_select_published ON blog_posts FOR SELECT USING (published = true OR author_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS blog_posts_insert_author ON blog_posts;
CREATE POLICY blog_posts_insert_author ON blog_posts FOR INSERT WITH CHECK (author_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS blog_posts_update_author ON blog_posts;
CREATE POLICY blog_posts_update_author ON blog_posts FOR UPDATE USING (author_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS blog_posts_delete_author ON blog_posts;
CREATE POLICY blog_posts_delete_author ON blog_posts FOR DELETE USING (author_id = get_current_user_id() OR is_admin() = true);

-- FORUM THREADS RLS
DROP POLICY IF EXISTS forum_threads_select_all ON forum_threads;
CREATE POLICY forum_threads_select_all ON forum_threads FOR SELECT USING (true);

DROP POLICY IF EXISTS forum_threads_insert_user ON forum_threads;
CREATE POLICY forum_threads_insert_user ON forum_threads FOR INSERT WITH CHECK (author_id = get_current_user_id() OR get_current_user_id() IS NOT NULL);

DROP POLICY IF EXISTS forum_threads_update_author ON forum_threads;
CREATE POLICY forum_threads_update_author ON forum_threads FOR UPDATE USING (author_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS forum_threads_delete_author ON forum_threads;
CREATE POLICY forum_threads_delete_author ON forum_threads FOR DELETE USING (author_id = get_current_user_id() OR is_admin() = true);

-- FORUM REPLIES RLS
DROP POLICY IF EXISTS forum_replies_select_all ON forum_replies;
CREATE POLICY forum_replies_select_all ON forum_replies FOR SELECT USING (true);

DROP POLICY IF EXISTS forum_replies_insert_user ON forum_replies;
CREATE POLICY forum_replies_insert_user ON forum_replies FOR INSERT WITH CHECK (author_id = get_current_user_id() OR get_current_user_id() IS NOT NULL);

DROP POLICY IF EXISTS forum_replies_update_author ON forum_replies;
CREATE POLICY forum_replies_update_author ON forum_replies FOR UPDATE USING (author_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS forum_replies_delete_author ON forum_replies;
CREATE POLICY forum_replies_delete_author ON forum_replies FOR DELETE USING (author_id = get_current_user_id() OR is_admin() = true);

-- AI SESSIONS RLS
DROP POLICY IF EXISTS ai_sessions_select_owner ON ai_sessions;
CREATE POLICY ai_sessions_select_owner ON ai_sessions FOR SELECT USING (user_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS ai_sessions_insert_owner ON ai_sessions;
CREATE POLICY ai_sessions_insert_owner ON ai_sessions FOR INSERT WITH CHECK (user_id = get_current_user_id() OR get_current_user_id() IS NOT NULL);

DROP POLICY IF EXISTS ai_sessions_update_owner ON ai_sessions;
CREATE POLICY ai_sessions_update_owner ON ai_sessions FOR UPDATE USING (user_id = get_current_user_id() OR is_admin() = true);

DROP POLICY IF EXISTS ai_sessions_delete_owner ON ai_sessions;
CREATE POLICY ai_sessions_delete_owner ON ai_sessions FOR DELETE USING (user_id = get_current_user_id() OR is_admin() = true);

-- AI MESSAGES RLS
DROP POLICY IF EXISTS ai_messages_select_owner ON ai_messages;
CREATE POLICY ai_messages_select_owner ON ai_messages FOR SELECT USING (
  EXISTS (SELECT 1 FROM ai_sessions s WHERE s.id = session_id AND (s.user_id = get_current_user_id() OR is_admin() = true))
);

DROP POLICY IF EXISTS ai_messages_insert_owner ON ai_messages;
CREATE POLICY ai_messages_insert_owner ON ai_messages FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM ai_sessions s WHERE s.id = session_id AND (s.user_id = get_current_user_id() OR is_admin() = true))
);

DROP POLICY IF EXISTS ai_messages_delete_owner ON ai_messages;
CREATE POLICY ai_messages_delete_owner ON ai_messages FOR DELETE USING (
  EXISTS (SELECT 1 FROM ai_sessions s WHERE s.id = session_id AND (s.user_id = get_current_user_id() OR is_admin() = true))
);

-- NEWSLETTER RLS
DROP POLICY IF EXISTS newsletter_select_admin ON newsletter_subscribers;
CREATE POLICY newsletter_select_admin ON newsletter_subscribers FOR SELECT USING (is_admin() = true);

DROP POLICY IF EXISTS newsletter_insert_email ON newsletter_subscribers;
CREATE POLICY newsletter_insert_email ON newsletter_subscribers FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS newsletter_update_admin ON newsletter_subscribers;
CREATE POLICY newsletter_update_admin ON newsletter_subscribers FOR UPDATE USING (is_admin() = true);

DROP POLICY IF EXISTS newsletter_delete_admin ON newsletter_subscribers;
CREATE POLICY newsletter_delete_admin ON newsletter_subscribers FOR DELETE USING (is_admin() = true);

-- WORKSPACE PROJECTS RLS
DROP POLICY IF EXISTS workspace_projects_select_team ON workspace_projects;
CREATE POLICY workspace_projects_select_team ON workspace_projects FOR SELECT USING (owner_id = get_current_user_id() OR is_admin() = true OR is_executive() = true);

DROP POLICY IF EXISTS workspace_projects_insert_owner ON workspace_projects;
CREATE POLICY workspace_projects_insert_owner ON workspace_projects FOR INSERT WITH CHECK (owner_id = get_current_user_id() OR is_admin() = true OR is_executive() = true);

DROP POLICY IF EXISTS workspace_projects_update_owner ON workspace_projects;
CREATE POLICY workspace_projects_update_owner ON workspace_projects FOR UPDATE USING (owner_id = get_current_user_id() OR is_admin() = true OR is_executive() = true);

DROP POLICY IF EXISTS workspace_projects_delete_owner ON workspace_projects;
CREATE POLICY workspace_projects_delete_owner ON workspace_projects FOR DELETE USING (owner_id = get_current_user_id() OR is_admin() = true);

-- WORKSPACE TASKS RLS
DROP POLICY IF EXISTS workspace_tasks_select_assignee ON workspace_tasks;
CREATE POLICY workspace_tasks_select_assignee ON workspace_tasks FOR SELECT USING (
  assignee_id = get_current_user_id() OR is_admin() = true OR is_executive() = true OR
  EXISTS (SELECT 1 FROM workspace_projects p WHERE p.id = project_id AND p.owner_id = get_current_user_id())
);

DROP POLICY IF EXISTS workspace_tasks_insert_team ON workspace_tasks;
CREATE POLICY workspace_tasks_insert_team ON workspace_tasks FOR INSERT WITH CHECK (
  is_admin() = true OR is_executive() = true OR assignee_id = get_current_user_id()
);

DROP POLICY IF EXISTS workspace_tasks_update_assignee ON workspace_tasks;
CREATE POLICY workspace_tasks_update_assignee ON workspace_tasks FOR UPDATE USING (
  assignee_id = get_current_user_id() OR is_admin() = true OR is_executive() = true OR
  EXISTS (SELECT 1 FROM workspace_projects p WHERE p.id = project_id AND p.owner_id = get_current_user_id())
);

DROP POLICY IF EXISTS workspace_tasks_delete_admin ON workspace_tasks;
CREATE POLICY workspace_tasks_delete_admin ON workspace_tasks FOR DELETE USING (is_admin() = true OR is_executive() = true);

-- AUDIT LOGS RLS
DROP POLICY IF EXISTS audit_logs_select_admin ON audit_logs;
CREATE POLICY audit_logs_select_admin ON audit_logs FOR SELECT USING (is_admin() = true);

-- =====================================================
-- SECTION 10: HELPER FUNCTIONS
-- =====================================================
CREATE OR REPLACE FUNCTION increment_thread_views(thread_slug TEXT) RETURNS VOID AS $$
BEGIN UPDATE forum_threads SET views = views + 1 WHERE slug = thread_slug; END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION increment_thread_replies(thread_id TEXT) RETURNS VOID AS $$
BEGIN UPDATE forum_threads SET replies = replies + 1 WHERE id = thread_id; END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION decrement_thread_replies(thread_id TEXT) RETURNS VOID AS $$
BEGIN UPDATE forum_threads SET replies = replies - 1 WHERE id = thread_id AND replies > 0; END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION complete_task(task_id TEXT) RETURNS VOID AS $$
BEGIN UPDATE workspace_tasks SET status = 'DONE', completed_at = CURRENT_TIMESTAMP WHERE id = task_id; END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION is_email_subscribed(sub_email TEXT) RETURNS BOOLEAN AS $$
BEGIN RETURN EXISTS (SELECT 1 FROM newsletter_subscribers WHERE email = sub_email AND is_active = true); END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================
-- SCHEMA COMPLETE
-- =====================================================
