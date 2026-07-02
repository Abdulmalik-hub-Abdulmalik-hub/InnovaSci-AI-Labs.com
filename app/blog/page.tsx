import Link from 'next/link';
import { Clock, User } from 'lucide-react';

const posts = [
  { slug: 'future-ai-scientific-research', title: 'The Future of AI in Scientific Research', summary: 'Exploring how AI is transforming scientific discovery.', featuredImg: 'https://images.unsplash.com/photo-1507413245164-6160d8298b31?w=1200', category: 'Research', author: 'Dr. Layla Rahman', readTime: 8 },
  { slug: 'building-responsible-ai-systems', title: 'Building Responsible AI Systems', summary: 'A guide to developing ethical AI systems.', featuredImg: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?w=1200', category: 'Models', author: 'Dr. Amir Patel', readTime: 6 },
  { slug: 'quantum-computing-next-frontier', title: 'Quantum Computing: The Next Frontier', summary: 'Overview of quantum computing developments.', featuredImg: 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=1200', category: 'Science', author: 'Dr. Layla Rahman', readTime: 7 },
];

export default function BlogPage() {
  return (
    <div className="pt-16">
      <section className="py-24 bg-gradient-to-b from-brand-deepBlue/10 to-transparent">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <h1 className="text-5xl font-bold text-text-slate200 mb-6 font-serif">Newsroom & <span className="text-gradient">Blog</span></h1>
          <p className="text-xl text-text-grey">Insights, research updates, and thought leadership.</p>
        </div>
      </section>

      <section className="py-16">
        <div className="max-w-7xl mx-auto px-4">
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {posts.map((post) => (
              <Link key={post.slug} href={`/blog/${post.slug}`} className="group block rounded-2xl overflow-hidden bg-background-slate900 border border-white/10 hover:border-empirical-teal/50 transition-all">
                <div className="relative h-48 overflow-hidden">
                  <img src={post.featuredImg} alt={post.title} className="w-full h-full object-cover group-hover:scale-105 transition-transform" />
                </div>
                <div className="p-6">
                  <span className="inline-block px-3 py-1 bg-empirical-teal/10 text-empirical-teal text-xs font-medium rounded-full mb-3">{post.category}</span>
                  <h3 className="text-lg font-bold text-text-slate200 mb-2 group-hover:text-empirical-teal">{post.title}</h3>
                  <p className="text-text-grey text-sm mb-4">{post.summary}</p>
                  <div className="flex items-center justify-between text-sm text-text-grey">
                    <span className="flex items-center gap-1"><User className="w-4 h-4" />{post.author}</span>
                    <span className="flex items-center gap-1"><Clock className="w-4 h-4" />{post.readTime} min</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
