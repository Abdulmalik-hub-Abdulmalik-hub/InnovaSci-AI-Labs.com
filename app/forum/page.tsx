import Link from 'next/link';
import { MessageSquare, Users, BookOpen, Wrench } from 'lucide-react';

const categories = [
  { name: 'General Discussion', slug: 'general', description: 'Open discussions about AI, science, and technology', icon: MessageSquare, threadCount: 156 },
  { name: 'Research Announcements', slug: 'research', description: 'Share and discuss new research findings', icon: BookOpen, threadCount: 89 },
  { name: 'Technical Support', slug: 'support', description: 'Get help with InnovaSci products', icon: Wrench, threadCount: 234 },
];

export default function ForumPage() {
  return (
    <div className="pt-16">
      <section className="py-24 bg-gradient-to-b from-emerald-500/10 to-transparent">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <h1 className="text-5xl font-bold text-text-slate200 mb-6 font-serif">Community <span className="text-gradient">Forum</span></h1>
          <p className="text-xl text-text-grey">Connect with researchers, engineers, and innovators.</p>
        </div>
      </section>

      <section className="py-16">
        <div className="max-w-7xl mx-auto px-4">
          <h2 className="text-2xl font-bold text-text-slate200 mb-6">Categories</h2>
          <div className="grid md:grid-cols-3 gap-6">
            {categories.map((cat) => (
              <div key={cat.slug} className="p-6 bg-background-slate900 border border-white/10 rounded-xl hover:border-white/20 transition-all cursor-pointer group">
                <div className="flex items-start gap-4">
                  <div className="w-12 h-12 rounded-xl bg-emerald-500/10 flex items-center justify-center group-hover:scale-110 transition-transform">
                    <cat.icon className="w-6 h-6 text-emerald-500" />
                  </div>
                  <div>
                    <h3 className="font-semibold text-text-slate200 mb-1 group-hover:text-emerald-400">{cat.name}</h3>
                    <p className="text-sm text-text-grey mb-2">{cat.description}</p>
                    <span className="text-xs text-text-grey">{cat.threadCount} threads</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
