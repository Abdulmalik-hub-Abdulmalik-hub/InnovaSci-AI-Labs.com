import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcryptjs';

const prisma = new PrismaClient();

async function main() {
  console.log('Starting database seed...');

  await prisma.auditLog.deleteMany();
  await prisma.aIMessage.deleteMany();
  await prisma.aISession.deleteMany();
  await prisma.forumPost.deleteMany();
  await prisma.forumThread.deleteMany();
  await prisma.forumCategory.deleteMany();
  await prisma.researchPaper.deleteMany();
  await prisma.newsletterCampaign.deleteMany();
  await prisma.newsletterSubscriber.deleteMany();
  await prisma.blogPost.deleteMany();
  await prisma.productBenchmark.deleteMany();
  await prisma.product.deleteMany();
  await prisma.service.deleteMany();
  await prisma.task.deleteMany();
  await prisma.subBranch.deleteMany();
  await prisma.userProfile.deleteMany();
  await prisma.user.deleteMany();
  await prisma.systemSetting.deleteMany();

  await prisma.systemSetting.createMany({
    data: [
      { key: 'ALLOW_REGISTRATIONS', value: 'true', description: 'Allow new user registrations' },
      { key: 'MAINTENANCE_MODE', value: 'false', description: 'Enable/disable maintenance mode' },
    ],
  });

  const passwordHash = await bcrypt.hash('innovasci123', 10);

  const users = await Promise.all([
    prisma.user.create({
      data: {
        email: 'admin@innovasci.com',
        passwordHash,
        fullName: 'Ahmad Al-Farsi',
        role: 'SYSTEM_ADMINISTRATOR',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=200',
            bio: 'System Administrator with 15+ years of experience in enterprise infrastructure management.',
            qualification: 'MSc in Computer Science',
            achievements: ['Zero-downtime deployments', 'Security certification', 'AWS certified'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'ceo@innovasci.com',
        passwordHash,
        fullName: 'Fatima Al-Mansoori',
        role: 'CEO',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
            bio: 'Visionary CEO leading InnovaSci AI Labs towards groundbreaking discoveries.',
            qualification: 'MBA, Harvard Business School',
            achievements: ['Forbes 30 Under 30', 'Tech Innovation Award', 'Global AI Leadership'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'cto@innovasci.com',
        passwordHash,
        fullName: 'Omar Hassan',
        role: 'CTO',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
            bio: 'Technology strategist driving innovation in AI and machine learning systems.',
            qualification: 'PhD in Computer Science, MIT',
            achievements: ['Patent holder', 'IEEE Senior Member', 'Cloud architecture expert'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'cso@innovasci.com',
        passwordHash,
        fullName: 'Layla Rahman',
        role: 'CSO_RESEARCH_DIRECTOR',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200',
            bio: 'Distinguished research director pioneering empirical scientific methodologies.',
            qualification: 'PhD in Quantum Physics, Cambridge',
            achievements: ['Nature publication', 'Research Excellence Award', '100+ citations'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'cpo@innovasci.com',
        passwordHash,
        fullName: 'Yusuf Al-Khalili',
        role: 'CPO_HEAD_OF_EDTECH',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
            bio: 'EdTech visionary transforming education through technology.',
            qualification: 'EdD in Educational Technology',
            achievements: ['EdTech innovator', 'Global education initiative', 'LMS architect'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'cfo@innovasci.com',
        passwordHash,
        fullName: 'Sara Ahmed',
        role: 'CFO',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=200',
            bio: 'Financial strategist with expertise in tech investments.',
            qualification: 'CFA, MBA Finance',
            achievements: ['IPO specialist', 'Risk management expert', 'M&A advisor'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'vpe@innovasci.com',
        passwordHash,
        fullName: 'Ali Mahmoud',
        role: 'VP_OF_ENGINEERING',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=200',
            bio: 'Engineering leader building scalable distributed systems.',
            qualification: 'MSc in Software Engineering',
            achievements: ['Microservices architecture', 'Team scaling expert', 'DevOps pioneer'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'airesearcher@innovasci.com',
        passwordHash,
        fullName: 'Dr. Amir Patel',
        role: 'PRINCIPAL_AI_ML_RESEARCHER',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=200',
            bio: 'Leading AI researcher specializing in deep learning and neural architectures.',
            qualification: 'PhD in Deep Learning, Stanford',
            achievements: ['NeurIPS best paper', 'Transformer architecture innovator', '200+ citations'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'fullstack@innovasci.com',
        passwordHash,
        fullName: 'James Chen',
        role: 'SENIOR_FULL_STACK_ENGINEER',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1507591064344-4c6ce005b128?w=200',
            bio: 'Full-stack engineer crafting seamless user experiences.',
            qualification: 'BSc in Computer Science',
            achievements: ['React specialist', 'Node.js expert', 'Performance optimizer'],
          },
        },
      },
    }),
    prisma.user.create({
      data: {
        email: 'designer@innovasci.com',
        passwordHash,
        fullName: 'Emma Wilson',
        role: 'SENIOR_UI_UX_DESIGNER',
        profile: {
          create: {
            avatarUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200',
            bio: 'Creative designer crafting intuitive digital experiences.',
            qualification: 'MFA in Interaction Design',
            achievements: ['Awwwards winner', 'Design system creator', 'UX research lead'],
          },
        },
      },
    }),
  ]);

  console.log(`${users.length} users seeded`);

  await prisma.subBranch.createMany({
    data: [
      {
        name: 'InnovaSci Open University',
        slug: 'innovasci-open-university',
        tagline: 'Graduate-Level Research & Innovation',
        description: 'Explore our graduate programs designed for advanced research in AI, quantum computing, and empirical sciences.',
        thumbnailUrl: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=800',
        branchUrl: '/university',
        status: 'PUBLISHED',
      },
      {
        name: 'InnovaSci Open Academy',
        slug: 'innovasci-open-academy',
        tagline: 'Vocational Excellence & Skill Development',
        description: 'Master practical skills through our comprehensive vocational programs.',
        thumbnailUrl: 'https://images.unsplash.com/photo-1509062522246-3755977927d7?w=800',
        branchUrl: '/academy',
        status: 'PUBLISHED',
      },
    ],
  });

  const products = await Promise.all([
    prisma.product.create({
      data: {
        name: 'InnovaSci AI Core',
        slug: 'innovasci-ai-core',
        tagline: 'Enterprise-Grade AI Infrastructure',
        description: 'A comprehensive AI infrastructure platform enabling organizations to build, deploy, and scale machine learning models efficiently.',
        thumbnailUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800',
        category: 'AI Infrastructure',
        status: 'PUBLISHED',
        metrics: JSON.stringify({ users: 10000, models: 500, uptime: 99.9 }),
      },
    }),
    prisma.product.create({
      data: {
        name: 'InnovaSci Research Suite',
        slug: 'innovasci-research-suite',
        tagline: 'Scientific Research Acceleration',
        description: 'An integrated platform for empirical research, hypothesis testing, and data analysis.',
        thumbnailUrl: 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800',
        category: 'Research Tools',
        status: 'PUBLISHED',
      },
    }),
    prisma.product.create({
      data: {
        name: 'InnovaSci Learn Platform',
        slug: 'innovasci-learn-platform',
        tagline: 'Adaptive Learning Ecosystem',
        description: 'A next-generation EdTech platform providing personalized learning experiences.',
        thumbnailUrl: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=800',
        category: 'EdTech',
        status: 'PUBLISHED',
      },
    }),
  ]);

  await prisma.productBenchmark.createMany({
    data: [
      { productId: products[0].id, metricName: 'MMLU', ourScore: 90.2, competitorName: 'Gemini Flash', competitorScore: 85.1 },
      { productId: products[0].id, metricName: 'HumanEval', ourScore: 92.5, competitorName: 'GPT-5 mini', competitorScore: 88.3 },
      { productId: products[0].id, metricName: 'GSM8K', ourScore: 95.8, competitorName: 'Gemini Flash', competitorScore: 91.2 },
    ],
  });

  await prisma.service.createMany({
    data: [
      {
        name: 'Custom Deep Learning Development',
        slug: 'custom-deep-learning-development',
        tagline: 'Tailored Neural Network Solutions',
        description: 'We design and develop custom deep learning models optimized for your specific use cases.',
        category: 'AI Development',
        status: 'PUBLISHED',
        pricing: 'Starting at $50,000',
        features: ['Custom architecture design', 'Model optimization', 'Deployment support'],
      },
      {
        name: 'Empirical Physics & Chemistry Simulations',
        slug: 'physics-chemistry-simulations',
        tagline: 'Advanced Scientific Computing',
        description: 'Leverage high-performance computing for molecular dynamics and quantum chemistry simulations.',
        category: 'Scientific Computing',
        status: 'PUBLISHED',
        pricing: 'Starting at $75,000',
        features: ['Molecular dynamics', 'Quantum chemistry', 'Monte Carlo simulations'],
      },
      {
        name: 'EdTech Virtual Classroom Architecture',
        slug: 'virtual-classroom-architecture',
        tagline: 'Immersive Learning Environments',
        description: 'Build state-of-the-art virtual classrooms with real-time collaboration.',
        category: 'EdTech Solutions',
        status: 'PUBLISHED',
        pricing: 'Starting at $30,000',
        features: ['Video conferencing', 'Interactive whiteboards', 'AI tutoring'],
      },
    ],
  });

  const csoUser = users.find(u => u.role === 'CSO_RESEARCH_DIRECTOR')!;
  const aiUser = users.find(u => u.role === 'PRINCIPAL_AI_ML_RESEARCHER')!;

  await prisma.blogPost.createMany({
    data: [
      {
        title: 'The Future of AI in Scientific Research',
        slug: 'future-ai-scientific-research',
        content: '# The Future of AI in Scientific Research\n\nArtificial intelligence is revolutionizing how we approach scientific discovery.\n\n## Key Developments\n\nOur latest research demonstrates how deep learning can accelerate drug discovery.',
        summary: 'Exploring how AI is transforming scientific discovery.',
        featuredImg: 'https://images.unsplash.com/photo-1507413245164-6160d8298b31?w=1200',
        category: 'Research',
        authorId: csoUser.id,
        readTime: 8,
        published: true,
      },
      {
        title: 'Building Responsible AI Systems',
        slug: 'building-responsible-ai-systems',
        content: '# Building Responsible AI Systems\n\nAs AI becomes more powerful, ensuring its responsible development is crucial.\n\n## Our Approach\n\nAt InnovaSci, we believe in developing AI that is transparent, fair, safe, and accountable.',
        summary: 'A guide to developing ethical AI systems.',
        featuredImg: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=1200',
        category: 'Models',
        authorId: aiUser.id,
        readTime: 6,
        published: true,
      },
    ],
  });

  await prisma.forumCategory.createMany({
    data: [
      { name: 'General Discussion', slug: 'general', description: 'Open discussions about AI, science, and technology' },
      { name: 'Research Announcements', slug: 'research', description: 'Share and discuss new research findings' },
      { name: 'Technical Support', slug: 'support', description: 'Get help with InnovaSci products' },
    ],
  });

  await prisma.newsletterSubscriber.createMany({
    data: [
      { email: 'researcher@university.edu' },
      { email: 'student@school.org' },
      { email: 'developer@techfirm.com' },
      { email: 'scientist@lab.org' },
      { email: 'educator@academy.edu' },
    ],
  });

  console.log('Database seed completed successfully!');
}

main()
  .catch((e) => {
    console.error('Seed error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
