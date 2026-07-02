import Link from 'next/link';
import { ArrowRight, Zap } from 'lucide-react';

const products = [
  { slug: 'innovasci-ai-core', name: 'InnovaSci AI Core', tagline: 'Enterprise-Grade AI Infrastructure', description: 'Build, deploy, and scale ML models efficiently.', thumbnailUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800', category: 'AI Infrastructure' },
  { slug: 'innovasci-research-suite', name: 'InnovaSci Research Suite', tagline: 'Scientific Research Acceleration', description: 'Empirical research, hypothesis testing, and data analysis.', thumbnailUrl: 'https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?w=800', category: 'Research Tools' },
  { slug: 'innovasci-learn-platform', name: 'InnovaSci Learn Platform', tagline: 'Adaptive Learning Ecosystem', description: 'Personalized learning with AI-driven recommendations.', thumbnailUrl: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=800', category: 'EdTech' },
];

const benchmarks = [
  { metric: 'MMLU', ourScore: 90.2, geminiScore: 85.1 },
  { metric: 'HumanEval', ourScore: 92.5, gptScore: 88.3 },
  { metric: 'GSM8K', ourScore: 95.8, geminiScore: 91.2 },
];

export default function ProductsPage() {
  return (
    <div className="pt-16">
      <section className="py-24 bg-gradient-to-b from-science-purple/10 to-transparent">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <h1 className="text-5xl font-bold text-text-slate200 mb-6 font-serif">Our <span className="text-gradient">Products</span></h1>
          <p className="text-xl text-text-grey">Cutting-edge solutions for AI, research, and education.</p>
        </div>
      </section>

      <section className="py-16">
        <div className="max-w-7xl mx-auto px-4">
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {products.map((product) => (
              <Link key={product.slug} href={`/products/${product.slug}`} className="group block rounded-2xl overflow-hidden bg-background-slate900 border border-white/10 hover:border-empirical-teal/50 transition-all">
                <div className="relative h-48 overflow-hidden">
                  <img src={product.thumbnailUrl} alt={product.name} className="w-full h-full object-cover group-hover:scale-105 transition-transform" />
                </div>
                <div className="p-6">
                  <span className="inline-block px-3 py-1 bg-science-purple/10 text-science-purple text-xs font-medium rounded-full mb-3">{product.category}</span>
                  <h3 className="text-xl font-bold text-text-slate200 mb-2">{product.name}</h3>
                  <p className="text-empirical-teal text-sm font-medium mb-3">{product.tagline}</p>
                  <p className="text-text-grey text-sm">{product.description}</p>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      <section className="py-16 bg-background-slate900/50">
        <div className="max-w-7xl mx-auto px-4">
          <h2 className="text-3xl font-bold text-text-slate200 mb-8 font-serif text-center">Performance Benchmarks</h2>
          <div className="bg-background-slate900 border border-white/10 rounded-2xl p-8">
            <table className="w-full">
              <thead>
                <tr className="border-b border-white/10">
                  <th className="text-left py-4 text-text-grey">Benchmark</th>
                  <th className="text-center py-4 text-science-purple">InnovaSci</th>
                  <th className="text-center py-4 text-text-grey">Gemini Flash</th>
                  <th className="text-center py-4 text-text-grey">GPT-5 mini</th>
                </tr>
              </thead>
              <tbody>
                {benchmarks.map((b, i) => (
                  <tr key={i} className="border-b border-white/5">
                    <td className="py-4 text-text-slate200">{b.metric}</td>
                    <td className="py-4 text-center text-science-purple font-bold">{b.ourScore}%</td>
                    <td className="py-4 text-center text-text-grey">{b.geminiScore || '-'}</td>
                    <td className="py-4 text-center text-text-grey">{b.gptScore || '-'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </div>
  );
}
