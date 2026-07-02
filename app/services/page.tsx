import Link from 'next/link';
import { Code, FlaskConical, GraduationCap } from 'lucide-react';

const services = [
  { slug: 'custom-deep-learning-development', name: 'Custom Deep Learning Development', tagline: 'Tailored Neural Network Solutions', description: 'We design and develop custom deep learning models optimized for your specific use cases.', category: 'AI Development', pricing: 'Starting at $50,000', icon: Code, color: 'from-purple-500 to-purple-600' },
  { slug: 'physics-chemistry-simulations', name: 'Empirical Physics & Chemistry Simulations', tagline: 'Advanced Scientific Computing', description: 'Leverage high-performance computing for molecular dynamics and quantum chemistry simulations.', category: 'Scientific Computing', pricing: 'Starting at $75,000', icon: FlaskConical, color: 'from-blue-500 to-blue-600' },
  { slug: 'virtual-classroom-architecture', name: 'EdTech Virtual Classroom Architecture', tagline: 'Immersive Learning Environments', description: 'Build state-of-the-art virtual classrooms with real-time collaboration and AI tutoring.', category: 'EdTech Solutions', pricing: 'Starting at $30,000', icon: GraduationCap, color: 'from-emerald-500 to-emerald-600' },
];

export default function ServicesPage() {
  return (
    <div className="pt-16">
      <section className="py-24 bg-gradient-to-b from-empirical-teal/10 to-transparent">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <h1 className="text-5xl font-bold text-text-slate200 mb-6 font-serif">Our <span className="text-gradient">Services</span></h1>
          <p className="text-xl text-text-grey">Enterprise solutions tailored to accelerate your initiatives.</p>
        </div>
      </section>

      <section className="py-16">
        <div className="max-w-7xl mx-auto px-4">
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {services.map((service) => (
              <div key={service.slug} className="p-8 rounded-2xl bg-background-slate900 border border-white/10 hover:border-empirical-teal/50 transition-all">
                <div className={`w-14 h-14 rounded-xl bg-gradient-to-r ${service.color} bg-opacity-10 mb-6 flex items-center justify-center`}>
                  <service.icon className={`w-7 h-7 bg-gradient-to-r ${service.color} bg-clip-text`} />
                </div>
                <span className="inline-block px-3 py-1 bg-empirical-teal/10 text-empirical-teal text-xs font-medium rounded-full mb-3">{service.category}</span>
                <h3 className="text-xl font-bold text-text-slate200 mb-2">{service.name}</h3>
                <p className="text-empirical-teal text-sm font-medium mb-3">{service.tagline}</p>
                <p className="text-text-grey text-sm mb-6">{service.description}</p>
                <div className="flex items-center justify-between pt-6 border-t border-white/10">
                  <span className="text-text-slate200 font-semibold">{service.pricing}</span>
                  <Link href="/login" className="text-empirical-teal hover:text-empirical-tealLight text-sm font-medium">Contact Us →</Link>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
