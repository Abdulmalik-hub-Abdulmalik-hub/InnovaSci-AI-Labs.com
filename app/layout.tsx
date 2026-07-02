import type { Metadata } from 'next';
import './globals.css';
import { Navigation } from '@/components/layout/Navigation';
import { Footer } from '@/components/layout/Footer';
import { HakeemChat } from '@/components/hakeem/HakeemChat';

export const metadata: Metadata = {
  title: 'InnovaSci AI Labs',
  description: 'Enterprise Technology, EdTech, and Scientific Research Platform',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="min-h-screen flex flex-col">
        <Navigation />
        <main className="flex-1 pt-16">{children}</main>
        <Footer />
        <HakeemChat />
      </body>
    </html>
  );
}
