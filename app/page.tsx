import Link from 'next/link';
import { ArrowRight, Brain, BookOpen, FlaskConical, Users, Sparkles } from 'lucide-react';

export default function HomePage() {
  return (
    <div>
      <section className="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <div className="absolute inset-0 bg-hero-gradient opacity-10" />
        <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24 text-center">
          <div className="flex justify-center mb-8">
            <div className="inline-flex items-center gap-2 px-4 py-2 bg-white/5 border border-white/10 rounded-full">
              <Sparkles className="w-4 h-4 text-empirical-teal" />
              <span className="text-text-slate200 text-sm">Pioneering the Future of Intelligence</span>
            </div>
          </div>
          <h1 className="text-5xl md:text-7xl font-bold text-text-slate200 mb-6 font-serif">
            InnovaSci <span className="text-gradient">AI Labs</span>
          </h1>
          <p className="text-xl md:text-2xl text-text-grey max-w-4xl mx-auto mb-12">
            Where cutting-edge technology meets scientific excellence. We build the systems that will shape tomorrow.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/products" className="inline-flex items-center gap-2 px-8 py-4 bg-gradient-to-r from-science-purple to-brand-deepBlue text-white rounded-xl font-semibold hover:opacity-90">
              Explore Products <ArrowRight className="w-5 h-5" />
            </Link>
            <Link href="/login" className="inline-flex items-center gap-2 px-8 py-4 bg-white/5 border border-white/20 text-text-slate200 rounded-xl font-semibold hover:border-empirical-teal">
              Access Portal
            </Link>
          </div>
        </div>
      </section>

      <section className="py-20 bg-background-slate900/50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {[
              { label: 'Active Researchers', value: '2,500+', icon: FlaskConical },
              { label: 'Products Deployed', value: '50+', icon: Sparkles },
              { label: 'Students Enrolled', value: '50,000+', icon: BookOpen },
              { label: 'Research Papers', value: '340+', icon: Users },
            ].map((stat, index) => (
              <div key={index} className="text-center">
                <div className="inline-flex items-center justify-center w-14 h-14 rounded-xl bg-science-purple/10 border border-science-purple/20 mb-4">
                  <stat.icon className="w-7 h-7 text-science-purple" />
                </div>
                <div className="text-3xl font-bold text-text-slate200 mb-2">{stat.value}</div>
                <div className="text-text-grey text-sm">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="py-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-bold text-text-slate200 mb-4 font-serif">Our Divisions</h2>
          </div>
          <div className="grid md:grid-cols-2 gap-8">
            <div className="p-8 rounded-2xl bg-gradient-to-br from-science-purple/20 to-science-purple/5 border border-science-purple/30">
              <div className="flex items-center gap-4 mb-6">
                <div className="w-16 h-16 rounded-xl bg-science-purple/20 flex items-center justify-center">
                  <Brain className="w-8 h-8 text-science-purple" />
                </div>
                <div>
                  <h3 className="text-2xl font-bold text-text-slate200">InnovaSci Open University</h3>
                  <p className="text-science-purple text-sm">Graduate-Level Research</p>
                </div>
              </div>
              <p className="text-text-grey mb-6">Explore graduate programs designed for advanced research in AI, quantum computing, and empirical sciences.</p>
              <Link href="/university" className="text-science-purple hover:text-science-purpleLight font-medium">Explore University →</Link>
            </div>
            <div className="p-8 rounded-2xl bg-gradient-to-br from-empirical-teal/20 to-empirical-teal/5 border border-empirical-teal/30">
              <div className="flex items-center gap-4 mb-6">
                <div className="w-16 h-16 rounded-xl bg-empirical-teal/20 flex items-center justify-center">
                  <BookOpen className="w-8 h-8 text-empirical-teal" />
                </div>
                <div>
                  <h3 className="text-2xl font-bold text-text-slate200">InnovaSci Open Academy</h3>
                  <p className="text-empirical-teal text-sm">Vocational Excellence</p>
                </div>
              </div>
              <p className="text-text-grey mb-6">Master practical skills through comprehensive vocational programs with hands-on learning experiences.</p>
              <Link href="/academy" className="text-empirical-teal hover:text-empirical-tealLight font-medium">Explore Academy →</Link>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
