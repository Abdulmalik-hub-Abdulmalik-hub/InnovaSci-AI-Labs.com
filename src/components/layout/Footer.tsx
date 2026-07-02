import Link from 'next/link';
import { Brain, Twitter, Github, Linkedin, Mail } from 'lucide-react';

export function Footer() {
  return (
    <footer className="bg-background-slate900 border-t border-white/10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <Link href="/" className="flex items-center space-x-3 mb-4">
              <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-science-purple to-empirical-teal flex items-center justify-center">
                <Brain className="w-6 h-6 text-white" />
              </div>
              <span className="text-xl font-bold text-text-slate200">InnovaSci</span>
            </Link>
            <p className="text-text-grey text-sm mb-6">Pioneering the future of AI, education, and scientific research.</p>
            <div className="flex space-x-4">
              <a href="#" className="text-text-grey hover:text-empirical-teal"><Twitter className="w-5 h-5" /></a>
              <a href="#" className="text-text-grey hover:text-empirical-teal"><Github className="w-5 h-5" /></a>
              <a href="#" className="text-text-grey hover:text-empirical-teal"><Linkedin className="w-5 h-5" /></a>
              <a href="#" className="text-text-grey hover:text-empirical-teal"><Mail className="w-5 h-5" /></a>
            </div>
          </div>
          <div>
            <h3 className="text-text-slate200 font-semibold mb-4">Products</h3>
            <ul className="space-y-2 text-sm">
              <li><Link href="/products" className="text-text-grey hover:text-empirical-teal">AI Core</Link></li>
              <li><Link href="/products" className="text-text-grey hover:text-empirical-teal">Research Suite</Link></li>
              <li><Link href="/products" className="text-text-grey hover:text-empirical-teal">Learn Platform</Link></li>
            </ul>
          </div>
          <div>
            <h3 className="text-text-slate200 font-semibold mb-4">Resources</h3>
            <ul className="space-y-2 text-sm">
              <li><Link href="/blog" className="text-text-grey hover:text-empirical-teal">Blog</Link></li>
              <li><Link href="/forum" className="text-text-grey hover:text-empirical-teal">Forum</Link></li>
              <li><Link href="/workspace" className="text-text-grey hover:text-empirical-teal">Workspace</Link></li>
            </ul>
          </div>
          <div>
            <h3 className="text-text-slate200 font-semibold mb-4">Newsletter</h3>
            <p className="text-text-grey text-sm mb-4">Subscribe for updates.</p>
            <form action="/api/newsletter/subscribe" method="POST" className="flex gap-2">
              <input type="email" name="email" placeholder="your@email.com" className="flex-1 px-3 py-2 bg-background-slate950 border border-white/10 rounded-lg text-sm" required />
              <button type="submit" className="px-4 py-2 bg-gradient-to-r from-science-purple to-brand-deepBlue text-white text-sm rounded-lg">Subscribe</button>
            </form>
          </div>
        </div>
        <div className="border-t border-white/10 mt-8 pt-8 text-center text-text-grey text-sm">
          © {new Date().getFullYear()} InnovaSci AI Labs. All rights reserved.
        </div>
      </div>
    </footer>
  );
}
