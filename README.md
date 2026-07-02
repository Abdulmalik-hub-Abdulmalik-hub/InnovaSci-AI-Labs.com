# InnovaSci AI Labs

Enterprise Technology, EdTech, and Scientific Research Platform

## Tech Stack

- **Framework:** Next.js 14 with App Router
- **Language:** TypeScript
- **Database:** PostgreSQL with Prisma ORM
- **Styling:** Tailwind CSS
- **AI:** Google Gemini API (Hakeem Chat Assistant)

## Getting Started

### 1. Install Dependencies

```bash
npm install
```

### 2. Set Up Environment Variables

Create a `.env` file with your database connection string:

```
DATABASE_URL="postgresql://user:password@host:5432/innovasci"
GEMINI_API_KEY="your-google-gemini-api-key"
NEXTAUTH_SECRET="your-secret-key"
NEXTAUTH_URL="http://localhost:3000"
```

### 3. Set Up Database

Run Prisma migrations to create the database schema:

```bash
npx prisma db push
```

### 4. Seed the Database

Populate the database with initial data:

```bash
npx prisma db seed
```

### 5. Run Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the application.

## Features

- **Home Page:** Hero section with company divisions
- **Products:** AI Core, Research Suite, Learn Platform
- **Services:** Deep Learning, Physics/Chemistry Simulations, Virtual Classroom
- **Blog/Newsroom:** Research articles and updates
- **Forum:** Community discussions
- **Workspace:** Team collaboration kanban board
- **Hakeem AI:** Chat assistant for inquiries
- **Role-Based Portals:** 21 different user roles with personalized dashboards

## Dev Credentials

For development, use these pre-configured accounts:

| Role | Email | Password |
|------|-------|----------|
| System Administrator | admin@innovasci.com | innovasci123 |
| CEO | ceo@innovasci.com | innovasci123 |
| CTO | cto@innovasci.com | innovasci123 |
| CSO (Research Director) | cso@innovasci.com | innovasci123 |
| Principal AI/ML Researcher | airesearcher@innovasci.com | innovasci123 |

## Deployment

This project is configured for Vercel deployment. The `vercel.json` file includes:
- Build command with Prisma generation
- Output directory configuration

### Vercel Setup

1. Import the repository to Vercel
2. Add environment variables in Vercel dashboard:
   - `DATABASE_URL` - Your PostgreSQL connection string
   - `GEMINI_API_KEY` - Google Gemini API key
3. Deploy

### Database Migration on Vercel

After deployment, run migrations using Vercel CLI:

```bash
npx vercel env pull .env.local
npx prisma migrate deploy
npx prisma db seed
```

## Project Structure

```
├── app/
│   ├── api/              # API routes
│   ├── blog/             # Blog page
│   ├── forum/            # Forum page
│   ├── login/            # Login page
│   ├── portal/[role]/     # Role-based portals
│   ├── products/          # Products page
│   ├── services/         # Services page
│   └── workspace/         # Workspace page
├── prisma/
│   ├── schema.prisma     # Database schema
│   └── seed.ts          # Database seed script
├── src/
│   ├── components/       # React components
│   └── lib/              # Utility libraries
└── vercel.json          # Vercel configuration
```

## License

Proprietary - InnovaSci AI Labs
