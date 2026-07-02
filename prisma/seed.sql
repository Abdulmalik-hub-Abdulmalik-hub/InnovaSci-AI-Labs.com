-- InnovaSci AI Labs Seed Data
-- Run this in Supabase SQL Editor AFTER schema.sql

-- Insert Users (password is 'innovasci123' hashed with bcrypt)
INSERT INTO users ("id", "email", password_hash, full_name, user_role, is_active) VALUES
('usr_001', 'admin@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Ahmad Al-Farsi', 'SYSTEM_ADMINISTRATOR', true),
('usr_002', 'ceo@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Fatima Al-Zahra', 'CEO', true),
('usr_003', 'cto@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Omar Khalil', 'CTO', true),
('usr_004', 'cso@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Dr. Layla Rahman', 'CSO_RESEARCH_DIRECTOR', true),
('usr_005', 'cpo@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Youssef Mansour', 'CPO_HEAD_OF_EDTECH', true),
('usr_006', 'vp_research@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Dr. Sara Hassan', 'VP_RESEARCH', true),
('usr_007', 'vp_engineering@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'James Chen', 'VP_ENGINEERING', true),
('usr_008', 'vp_business@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Ahmed Hassan', 'VP_BUSINESS_DEVELOPMENT', true),
('usr_009', 'finance@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Michael Brown', 'FINANCIAL_DIRECTOR', true),
('usr_010', 'hr@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Nadia Ibrahim', 'HUMAN_RESOURCES_DIRECTOR', true),
('usr_011', 'marketing@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Zara Ahmed', 'HEAD_OF_MARKETING', true),
('usr_012', 'legal@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'David Wilson', 'HEAD_OF_LEGAL', true),
('usr_013', 'airesearcher@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Dr. Amir Patel', 'PRINCIPAL_AI_RESEARCHER', true),
('usr_014', 'senior_dev@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Wei Zhang', 'SENIOR_SOFTWARE_ENGINEER', true),
('usr_015', 'junior_dev@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Maria Garcia', 'JUNIOR_SOFTWARE_DEVELOPER', true),
('usr_016', 'edustudent@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Aisha Mohammed', 'EDUCATION_SPECIALIST', true),
('usr_017', 'markcoord@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'John Smith', 'MARKETING_COORDINATOR', true),
('usr_018', 'hrcoord@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Sarah Johnson', 'HR_COORDINATOR', true),
('usr_019', 'customer@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Lisa Anderson', 'CUSTOMER_SUCCESS_MANAGER', true),
('usr_020', 'sales@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Robert Taylor', 'SALES_DEVELOPMENT_REP', true),
('usr_021', 'datasci@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Dr. Kenji Tanaka', 'DATA_SCIENTIST', true),
('usr_022', 'external@innovasci.com', '$2a$10$8K1p/a0dL1LXMIgp1L0wOe7RmYqWkfKnq4vXt1mHOhP7qWqNWMG3a', 'Dr. Emma Thompson', 'EXTERNAL_RESEARCHER', true)
ON CONFLICT ("id") DO NOTHING;

-- Insert Profiles
INSERT INTO profiles ("id", user_id, "bio", "qualification", "expertise", "title", "department", "location") VALUES
('prf_001', 'usr_001', 'System Administrator with 15+ years experience', 'MSc Computer Science', 'Infrastructure, Security', 'System Administrator', 'IT', 'Dubai, UAE'),
('prf_002', 'usr_002', 'Visionary CEO leading InnovaSci AI Labs', 'MBA Harvard, PhD AI', 'Strategic Planning, AI Leadership', 'Chief Executive Officer', 'Executive', 'Dubai, UAE'),
('prf_003', 'usr_003', 'CTO driving technical innovation', 'PhD Computer Engineering', 'Cloud Architecture, AI Systems', 'Chief Technology Officer', 'Engineering', 'Dubai, UAE'),
('prf_004', 'usr_004', 'Leading breakthrough research in AI and quantum computing', 'PhD Quantum Physics MIT', 'Quantum Computing, AI Research', 'Chief Scientific Officer', 'Research', 'London, UK'),
('prf_005', 'usr_005', 'Revolutionizing education through technology', 'EdD Stanford', 'EdTech, Learning Systems', 'Chief Product Officer', 'Product', 'San Francisco, USA'),
('prf_006', 'usr_006', 'Managing world-class research teams', 'PhD Neuroscience Cambridge', 'Neuroscience, AI Integration', 'VP of Research', 'Research', 'Berlin, Germany'),
('prf_007', 'usr_007', 'Building scalable AI infrastructure', 'MSc Software Engineering', 'Distributed Systems, MLOps', 'VP of Engineering', 'Engineering', 'Seattle, USA'),
('prf_008', 'usr_008', 'Expanding global partnerships', 'MBA INSEAD', 'Business Development, Partnerships', 'VP Business Development', 'Business', 'Singapore'),
('prf_009', 'usr_009', 'Financial strategy and planning', 'CPA, MBA Finance', 'Financial Planning, Investment', 'Financial Director', 'Finance', 'New York, USA'),
('prf_010', 'usr_010', 'Building exceptional teams', 'MSc HR Management', 'Talent Acquisition, Culture', 'HR Director', 'Human Resources', 'Dubai, UAE'),
('prf_011', 'usr_011', 'Brand and growth strategies', 'MBA Marketing', 'Brand Strategy, Growth', 'Head of Marketing', 'Marketing', 'London, UK'),
('prf_012', 'usr_012', 'Legal counsel and compliance', 'JD Law', 'IP Law, Compliance', 'Head of Legal', 'Legal', 'Washington D.C., USA'),
('prf_013', 'usr_013', 'Pioneering AI breakthroughs', 'PhD Machine Learning Stanford', 'Deep Learning, NLP', 'Principal AI Researcher', 'AI Research', 'San Francisco, USA'),
('prf_014', 'usr_014', 'Senior full-stack developer', 'BS Computer Science', 'React, Node.js, Python', 'Senior Software Engineer', 'Engineering', 'Tokyo, Japan'),
('prf_015', 'usr_015', 'Junior developer learning and growing', 'BS Software Engineering', 'JavaScript, Python', 'Junior Developer', 'Engineering', 'Madrid, Spain'),
('prf_016', 'usr_016', 'Education content specialist', 'MA Education Technology', 'Curriculum Design, E-Learning', 'Education Specialist', 'Education', 'Sydney, Australia'),
('prf_017', 'usr_017', 'Marketing campaigns coordinator', 'BA Communications', 'Social Media, Content', 'Marketing Coordinator', 'Marketing', 'Toronto, Canada'),
('prf_018', 'usr_018', 'HR operations coordinator', 'BA Human Resources', 'Recruitment, Onboarding', 'HR Coordinator', 'Human Resources', 'Dubai, UAE'),
('prf_019', 'usr_019', 'Customer success advocate', 'BA Business Administration', 'Customer Relations, Support', 'Customer Success Manager', 'Customer Success', 'Austin, USA'),
('prf_020', 'usr_020', 'Sales pipeline specialist', 'BA Sales Management', 'Lead Generation, CRM', 'Sales Development Rep', 'Sales', 'Chicago, USA'),
('prf_021', 'usr_021', 'Data science expert', 'PhD Statistics UCLA', 'Predictive Analytics, ML', 'Data Scientist', 'Data Science', 'Boston, USA'),
('prf_022', 'usr_022', 'External research collaborator', 'PhD Computational Biology', 'Bioinformatics, AI Applications', 'External Researcher', 'External Research', 'Zurich, Switzerland')
ON CONFLICT ("id") DO NOTHING;

-- Insert Products
INSERT INTO products ("id", "name", "description", "category", "price", "image", "features", is_active) VALUES
('prod_001', 'InnovaSci AI Core', 'Enterprise-grade AI infrastructure platform for building and deploying production ML models', 'AI Infrastructure', 999.00, 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800', 'Model Training|Automated ML Pipelines|GPU Acceleration|Model Versioning', true),
('prod_002', 'InnovaSci Research Suite', 'Comprehensive research platform with data analysis, visualization, and collaboration tools', 'Research Tools', 599.00, 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=800', 'Data Visualization|Statistical Analysis|Team Collaboration|Paper Writing Tools', true),
('prod_003', 'InnovaSci Learn Platform', 'Adaptive learning management system with AI-powered personalization', 'EdTech', 299.00, 'https://images.unsplash.com/photo-1501504905252-473c47e087f8?w=800', 'Adaptive Learning|Progress Tracking|Interactive Content|Gamification', true)
ON CONFLICT ("id") DO NOTHING;

-- Insert Services
INSERT INTO services ("id", "name", "description", "category", "price", "image", "features", is_active) VALUES
('svc_001', 'Deep Learning Development', 'Custom deep learning model development and training for your specific use cases', 'AI Development', 5000.00, 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=800', 'Custom Architecture Design|Transfer Learning|Fine-tuning|Model Optimization', true),
('svc_002', 'Physics Simulations', 'High-fidelity physics simulations for research and industrial applications', 'Research Services', 3500.00, 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=800', 'Computational Fluid Dynamics|Structural Analysis|Thermal Modeling|Multi-physics Coupling', true),
('svc_003', 'Chemistry Modeling', 'Molecular modeling and chemical reaction simulations', 'Research Services', 4000.00, 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800', 'Molecular Dynamics|Quantum Chemistry|Drug Discovery|Property Prediction', true),
('svc_004', 'Virtual Classroom Setup', 'Complete EdTech infrastructure setup and customization', 'EdTech Services', 2500.00, 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800', 'LMS Integration|Live Session Tools|Assessment Systems|Breakout Rooms', true)
ON CONFLICT ("id") DO NOTHING;

-- Insert Blog Posts
INSERT INTO blog_posts ("id", "title", "slug", "content", "excerpt", author_id, author_name, "tags", "category", is_published, published_at) VALUES
('blog_001', 'The Future of AI in Scientific Research', 'future-ai-scientific-research', 'AI is revolutionizing how we conduct scientific research...', 'Explore how artificial intelligence is transforming scientific discovery and research methodologies.', 'usr_004', 'Dr. Layla Rahman', 'AI,Research,Science', 'Research', true, NOW()),
('blog_002', 'Building Scalable ML Pipelines', 'scalable-ml-pipelines', 'Learn the best practices for building production-ready ML pipelines...', 'A comprehensive guide to designing and implementing scalable machine learning infrastructure.', 'usr_013', 'Dr. Amir Patel', 'ML,Engineering,Tutorial', 'Engineering', true, NOW()),
('blog_003', 'EdTech Trends 2026', 'edtech-trends-2026', 'The landscape of educational technology is evolving rapidly...', 'Discover the top EdTech trends shaping the future of learning in 2026.', 'usr_005', 'Youssef Mansour', 'EdTech,Education,Trends', 'Education', true, NOW()),
('blog_004', 'Quantum Computing Meets AI', 'quantum-computing-ai', 'The intersection of quantum computing and artificial intelligence...', 'Exploring the potential of quantum-enhanced AI systems.', 'usr_004', 'Dr. Layla Rahman', 'Quantum,AI,Innovation', 'Research', true, NOW())
ON CONFLICT ("id") DO NOTHING;

-- Insert Forum Threads
INSERT INTO forum_threads ("id", "title", "content", "slug", author_id, author_name, "category", "views", "replies", is_published) VALUES
('thread_001', 'Welcome to InnovaSci Forum', 'Welcome everyone! This is a space for researchers, developers, and AI enthusiasts to connect and collaborate.', 'welcome-forum', 'usr_001', 'Ahmad Al-Farsi', 'General', 245, 12, true),
('thread_002', 'Best Practices for Model Deployment', 'What are your recommended strategies for deploying ML models at scale?', 'model-deployment-best-practices', 'usr_013', 'Dr. Amir Patel', 'AI/ML', 189, 8, true),
('thread_003', 'EdTech Integration Tips', 'Sharing some tips for integrating our Learn Platform with existing systems.', 'edtech-integration-tips', 'usr_016', 'Aisha Mohammed', 'EdTech', 156, 6, true)
ON CONFLICT ("id") DO NOTHING;

-- Insert Forum Replies
INSERT INTO forum_replies ("id", thread_id, "content", author_id, author_name) VALUES
('reply_001', 'thread_002', 'Great topic! I recommend using Kubernetes for orchestration and implementing proper monitoring.', 'usr_007', 'James Chen'),
('reply_002', 'thread_002', 'Also consider using model caching and implementing A/B testing for gradual rollouts.', 'usr_014', 'Wei Zhang'),
('reply_003', 'thread_001', 'Excited to be part of this community! Looking forward to great discussions.', 'usr_022', 'Dr. Emma Thompson')
ON CONFLICT ("id") DO NOTHING;

-- Insert AI Sessions and Messages
INSERT INTO ai_sessions ("id", user_id, "title") VALUES
('sess_001', 'usr_001', 'Getting Started with AI Core')
ON CONFLICT ("id") DO NOTHING;

INSERT INTO ai_messages ("id", session_id, "role", "content") VALUES
('msg_001', 'sess_001', 'user', 'How do I get started with InnovaSci AI Core?'),
('msg_002', 'sess_001', 'assistant', 'Welcome to InnovaSci AI Core! To get started, you can...')
ON CONFLICT ("id") DO NOTHING;

-- Insert Workspace Projects
INSERT INTO workspace_projects ("id", "name", "description", owner_id, "status") VALUES
('proj_001', 'Q4 AI Initiative', 'Quarterly AI research and development goals', 'usr_004', 'Active'),
('proj_002', 'EdTech Platform Upgrade', 'Upgrading our learning management system', 'usr_005', 'Active'),
('proj_003', 'Research Paper Publication', 'Submitting our latest findings to Nature', 'usr_006', 'In Progress')
ON CONFLICT ("id") DO NOTHING;

-- Insert Workspace Tasks
INSERT INTO workspace_tasks ("id", project_id, "title", "status", "priority", assignee_id, assignee_name) VALUES
('task_001', 'proj_001', 'Complete MLOps pipeline setup', 'IN_PROGRESS', 'HIGH', 'usr_013', 'Dr. Amir Patel'),
('task_002', 'proj_001', 'Model performance optimization', 'TODO', 'MEDIUM', 'usr_014', 'Wei Zhang'),
('task_003', 'proj_002', 'Update learning modules', 'IN_PROGRESS', 'HIGH', 'usr_016', 'Aisha Mohammed'),
('task_004', 'proj_3', 'Draft abstract submission', 'IN_REVIEW', 'HIGH', 'usr_006', 'Dr. Sara Hassan')
ON CONFLICT ("id") DO NOTHING;
