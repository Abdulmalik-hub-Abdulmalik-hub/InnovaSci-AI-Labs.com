'use client';
import Link from 'next/link';
import { useState } from 'react';
import { Menu, X, Brain } from 'lucide-react';

const navLinks = [
  { href: '/', label: 'Home' },
  { href: '/products', label: 'Products' },
  { href: '/services', label: 'Services' },
  { href: '/blog', label: 'Blog' },
  { href: '/forum', label: 'Forum' },
  { href: '/workspace', label: 'Workspace' },
];

export function Navigation() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-background-slate950/95 backdrop-blur-lg border-b border-white/10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          <Link href="/" className="flex items-center space-x-3">
            <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-science-purple to-empirical-teal flex items-center justify-center">
              <Brain className="w-6 h-6 text-white" />
            </div>
            <span className="text-xl font-bold text-text-slate200">InnovaSci</span>
          </Link>

          <div className="hidden md:flex items-center space-x-8">
            {navLinks.map((link) => (
              <Link key={link.href} href={link.href} className="text-text-slate200 hover:text-empirical-teal transition-colors font-medium">
                {link.label}
              </Link>
            ))}
          </div>

          <div className="hidden md:flex items-center space-x-4">
            <Link href="/login" className="px-4 py-2 text-text-slate200 hover:text-white border border-white/20 rounded-lg hover:border-empirical-teal transition-all">
              Sign In
            </Link>
            <Link href="/login" className="px-4 py-2 bg-gradient-to-r from-science-purple to-brand-deepBlue text-white rounded-lg hover:opacity-90 transition-opacity">
              Get Started
            </Link>
          </div>

          <button className="md:hidden text-text-slate200" onClick={() => setIsOpen(!isOpen)}>
            {isOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>
      </div>

      {isOpen && (
        <div className="md:hidden py-4 border-t border-white/10 px-4">
          {navLinks.map((link) => (
            <Link key={link.href} href={link.href} className="block py-2 text-text-slate200 hover:text-empirical-teal" onClick={() => setIsOpen(false)}>
              {link.label}
            </Link>
          ))}
        </div>
      )}
    </nav>
  );
}
